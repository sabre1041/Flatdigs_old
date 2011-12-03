package com.flatdigs.controller

import com.flatdigs.auth.User
import com.flatdigs.model.Property
import com.flatdigs.model.Unit
import com.flatdigs.model.Lease.LeaseStatus
import com.sun.xml.internal.ws.api.PropertySet.PropertyMap;

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

import org.hibernate.FetchMode as FM

class SearchController {
	
	def userService
	
	static allowedMethods = [updateMap:'POST']
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def index = {
		/*
		def user = currentUser()
		def properties = Property.findAllByManager(user)
		
		[properties : properties]
*/
		
		 }
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def updateMap = {
		def user = userService.getCurrentUser()
		
		BigDecimal formMinPrice = new BigDecimal(params.minPrice)
		BigDecimal formMaxPrice = new BigDecimal(params.maxPrice)
		
		def units = Unit.createCriteria().list {
		//	eq("bedrooms", Integer.parseInt(params.bedrooms))
		//	eq("bathrooms", Integer.parseInt(params.bathrooms))
			currentLease {
				eq("leaseStatus", LeaseStatus.OPEN)
				lt("searchableDate", new Date())
				between("listPrice", formMinPrice, formMaxPrice)
			}

			
			fetchMode "property", FM.JOIN
		}
		
		def properties = [:]
		
		
		units.each() { unit ->
			if(properties.containsKey(unit.property.id))
			{
				def newProperty = properties.getAt(unit.property.id)
				newProperty.units << unit
								
			}
			else
			{
				def newProperty = unit.property
				def unitList = []
				unitList << unit
				newProperty.units = unitList
				properties.put(newProperty.id, newProperty)
			}
		}
			
				
		render(contentType: "text/json") {
			array {
				properties.values().each() { props ->
											
						int maxBathrooms = props.units.bathrooms.max()
						int minBathrooms = props.units.bathrooms.min()

						int minBedrooms = props.units.bedrooms.min()
						int maxBedrooms = props.units.bedrooms.max()
						
						BigDecimal maxPrice = props.units.currentLease.listPrice.max()
						BigDecimal minPrice = props.units.currentLease.listPrice.min()
						
						int priceComparision = (((minPrice-formMinPrice)/(formMaxPrice-formMinPrice))*100)
						
						
						/*
						BigDecimal minPrice = props.units.askingPrice.min()
						BigDecimal minPrice = props.units.askingPrice.max()
						*/
				
						
						property id : props.id, 
						propertyType : props.propertyType.value,
						streetNumber : props.streetNumber, 
						streetName : props.streetName,
						latitude :  props.latitude,
						longitude :  props.longitude,
						name : props?.name,
						bathrooms : maxBathrooms == minBathrooms ? minBathrooms : "${minBathrooms} to ${maxBathrooms}",
						bedrooms : maxBedrooms == minBedrooms ? minBedrooms : "${minBedrooms} to ${maxBedrooms}",
						price : maxPrice == minPrice ? minPrice : "${minPrice} to ${maxPrice}",
						comparision : priceComparision
						
				}
				
			}
		}
		
	}
	/*
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def updateAvailableUnits =  {
		
		def user = userService.getCurrentUser()
		
		def units = Unit.createCriteria().list {
			
			property {
				eq("id", Long.valueOf(params.id))
			}
		}
		
		println(units)
		
		String propertyAddress = "${}"
			
				
		render(contentType: "text/json") {
			array {
				properties.values().each() { props ->
											
						int maxBathrooms = props.units.bathrooms.max()
						int minBathrooms = props.units.bathrooms.min()

						int minBedrooms = props.units.bedrooms.min()
						int maxBedrooms = props.units.bedrooms.max()
						
						BigDecimal maxPrice = props.units.currentLease.listPrice.max()
						BigDecimal minPrice = props.units.currentLease.listPrice.min()
			
						BigDecimal minPrice = props.units.askingPrice.min()
						BigDecimal minPrice = props.units.askingPrice.max()
			
				
						
						property id : params.id,
						propertyType : props.propertyType.value,
						streetNumber : props.streetNumber,
						streetName : props.streetName,
						latitude :  props.latitude,
						longitude :  props.longitude
						//name : props?.name,
						//bathrooms : maxBathrooms == minBathrooms ? minBathrooms : "${minBathrooms} to ${maxBathrooms}",
						//bedrooms : maxBedrooms == minBedrooms ? minBedrooms : "${minBedrooms} to ${maxBedrooms}",
						//price : maxPrice = minPrice ? minPrice : "${minPrice} to ${maxPrice}"
						
				}
				
			}
		}
		
	}
	
	*/
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def showDetails = {
		println "Inside Show Details"
		
	}
	
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
	def search = {
		if(params.get("searchform") !=null)
		{
						
			[searchParams : params]
		}

		
	}
	
	private transformToJSON(property)
	{
		
	}
	
	private performSearch()
	{
				
	}
	
	
}
