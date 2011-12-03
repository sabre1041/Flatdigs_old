package com.flatdigs.model

import com.flatdigs.auth.User

class Unit {
	
	
	static belongsTo = [ property : Property]
	static hasMany = [leaseHistory : Lease]
	static hasOne = [currentLease : Lease]
	
	String number	
	int bedrooms
	int bathrooms
	Date dateCreated
	Date lastUpdated
	int floors
	boolean active
	boolean available
	User owner
	
	
	
    static constraints = {
		bedrooms nullable : false, min : 1
		bathrooms nullable : false,min : 1
		number blank : false
		currentLease nullable : true
		available nullable : false
    }
	
	static mapping = {
		
		sort "number" : "desc"
		
	}
	
	String toString()
	{
		number
	}
}
