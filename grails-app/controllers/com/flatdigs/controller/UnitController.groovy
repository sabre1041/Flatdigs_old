package com.flatdigs.controller

import com.flatdigs.model.*
import com.flatdigs.auth.User
import grails.plugins.springsecurity.Secured


class UnitController {
	
	def springSecurityService

    //def index = { }
	
	static defaultAction = "list"
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def list = {
		
		def user = currentUser()
		def units = Unit.findAllByOwner(user)
		
		[units : units]
		
	}

	
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def delete = {
		
		def Unit unit = Unit.get(params['id'])
		def User user = currentUser()
		def User owner = unit.owner
		
		
		if(unit!=null && owner==user)
		{
			try
			{
				unit.delete(flush : true)
				flash.message = "Deleted Unit ${unit.number}"
				redirect(action : "list")
	
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "Error Unit ${unit.number}"
				redirect(action : "list")
			}
		}
		else
		{
			redirect(action : "list")
		}
		
	}
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def save = {
		def unitInstance = new Unit(params)
		def currentUser = currentUser()
		unitInstance.setOwner(currentUser)
		if (unitInstance.save(flush: true)) {
			flash.message = "Created ${unitInstance.number}"
			redirect(action : "list")
		}
		else {
			render(view: "create", model: [unitInstance: unitInstance])
		}
		
	}
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def create = {
		
		def property = Property.get(params['id'])
		if(property!=null)
		{
			def unitInstance = new Unit()
			unitInstance.setProperty(property)
			unitInstance.properties = params
			return [unitInstance: unitInstance]
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
