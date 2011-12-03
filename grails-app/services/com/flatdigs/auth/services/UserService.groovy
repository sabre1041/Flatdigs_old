package com.flatdigs.auth.services

import com.flatdigs.auth.User

class UserService {

	def springSecurityService
	
    static transactional = true

    def getCurrentUser() {
		
		User.get(springSecurityService.principal.id);

    }
}
