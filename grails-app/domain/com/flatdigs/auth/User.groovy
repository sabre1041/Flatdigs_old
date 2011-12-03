package com.flatdigs.auth

import com.flatdigs.model.Property
import com.flatdigs.model.Unit

class User extends SecUser {
	
	static hasMany = [props : Property, unit : Unit]
	
	String firstName
	String lastName
	int age
	int creditScore
	String email
	
	

    static constraints = {
		lastName blank : false
		firstName blank : false
		email blank : false
		
    }
	
	String toString()
	{
		"${firstName} ${lastName}"
	}
}
