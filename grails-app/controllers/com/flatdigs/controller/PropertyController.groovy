package com.flatdigs.controller

import com.flatdigs.model.*
import com.flatdigs.auth.*	
import grails.plugins.springsecurity.Secured

class PropertyController {

	def springSecurityService
    //def index = { }
	
	//def scaffold = Property
	
	static defaultAction = "list"
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def list = {
		
		def user = currentUser()
		def properties = Property.findAllByManager(user)
		
		[properties : properties]
		
	}
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def create = {		
		def propertyInstance = new Property()
		propertyInstance.properties = params
		return [propertyInstance: propertyInstance]

	}
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def save = {
		def propertyInstance = new Property(params)
		def currentUser = currentUser()
		
		propertyInstance.setManager(currentUser)
		if (propertyInstance.save(flush: true)) {
			flash.message = "Created ${propertyInstance.streetNumber} ${propertyInstance.streetName}"
			redirect(action : "list")
		}
		else {
			render(view: "create", model: [propertyInstance: propertyInstance])
		}
		
	}
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def delete = {
		
		def Property prop = Property.get(params['id'])
		def User user = currentUser()
		def User manager = prop.manager
		
		
		if(prop!=null && manager==user)
		{
			try
			{
				prop.delete(flush : true)
				flash.message = "Deleted ${prop.streetNumber} ${prop.streetName}"
				redirect(action : "list")
	
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "Error Deleting ${prop.streetNumber} ${prop.streetName}"
				redirect(action : "list")
			}
		}
		else
		{
			redirect(action : "list")
		}		
		
	}
	
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def show = {
		def Property propertyInstance = Property.get(params['id'])
		propertyInstance.properties = params
		
		def currentUser = currentUser()
		def User manager = propertyInstance.manager
		
		if(propertyInstance!=null && manager==currentUser)
		{
			return [propertyInstance: propertyInstance]
		}
		else
		{
			redirect(action : "list")
		}
		
		
		
	}
	
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def showDetails = {
		
		def Property propertyInstance = Property.get(params['id'])
		if(propertyInstance!=null)
		{
			return [propertyInstance: propertyInstance]
		}
		else
		{
			redirect(action : "list")
		}
		
		
	}
	
	
	
	
	private currentUser()
	{
		User.get(springSecurityService.principal.id);
	}
	
}
