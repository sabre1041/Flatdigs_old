package com.flatdigs.model

import java.util.Date;
import com.flatdigs.model.util.State
import com.flatdigs.auth.User

class Property {
	
	public enum PropertyType{
		TOWNHOUSE("Townhouse"),
		HIGHRISE("Highrise"),
		LOWRISE("Lowrise"),
		MIDRISE("Midrise"),
		HOUSE("House")
		
 
		final String value;
 
		PropertyType(String value) {
			this.value = value;
		}
		String toString(){
			value;
		}
		
		String getKey()
		 {
			 name()
		 }
	}
	
	static hasMany = [units : Unit]
	
	// TODO: Change this to a many to many relationship in the future
	//static hasOne = [manager : User]
	static hasOne = [ manager : User]
		
	String name
	PropertyType propertyType
	String streetNumber
	String streetName
	String city
	String zip
	String description
	String latitude
	String longitude
	int floors
	Date opened
	State state
	boolean active

    static constraints = {
		
		propertyType nullable : false
		name nullable : true
		streetNumber blank : false
		streetName blank : false
		zip blank : false
		city blank : false
		state blank : false, nullable : false
		opened nullable : true
		description nullable : true, maxSize: 1000
		floors nullable : false, min : 1
		
    }
	
	String toString()
	{
		"${streetNumber} ${streetName}"
	}
}
