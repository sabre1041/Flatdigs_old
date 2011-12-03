import com.flatdigs.auth.*
import com.flatdigs.model.util.State
import com.flatdigs.model.Property
import com.flatdigs.model.Property.PropertyType
import com.flatdigs.model.Unit
import com.flatdigs.model.Lease
import com.flatdigs.model.Lease.LeaseStatus

class BootStrap {
	
	def springSecurityService

    def init = { servletContext ->
		
		// Begin Database Initialization
	
		State il = new State(name : "Illinois", nameShort : "IL").save()
		State ny = new State(name : "New York", nameShort : "NY").save()
		
		
		def userRole = SecRole.findByAuthority("ROLE_USER") ?: new SecRole(authority : "ROLE_USER").save();
		def adminRole = SecRole.findByAuthority("ROLE_ADMIN") ?: new SecRole(authority : "ROLE_ADMIN").save();
		/*
		def role = new UserType(authority: 'ROLE_ADMIN', description: 'Admin role').save()
		def admin = new User(username: 'admin', userRealName: 'admin',
							 password: springSecurityService.encodePassword('admin'),
							 enabled: true, email: 'admin@servername')
		//admin.addToRoles(UserType.find)
		admin.save()
		*/
		println('Creating New User')
		def newUser = new User(firstName: "Andrew", lastName : "Block", username: "admin", email : "admin@flatdigs.com", password : "admin", enabled: true, age : 23)
		
		// Creating New Properties
		def state = State.findByNameShort("NY")
		def state2 = State.findByNameShort("IL")
		def property1 = new Property(name : "Canisius High School", streetNumber: "1180", streetName : "Deleware Ave", 
									 city : "Buffalo", state : state, zip : 14203, floors : 2, description : "Best School",
									 latitude : "42.916150", longitude : "-78.868991", propertyType : PropertyType.LOWRISE)
		def property2 = new Property(streetNumber: "1143", streetName : "West George Street",
			city : "Chicago", state : state2, zip : 60657, floors : 3,
			latitude: "41.934489", longitude : "-87.657583", propertyType : PropertyType.HOUSE)
		
		
		def lease1 = new Lease(leaseStatus : LeaseStatus.OPEN, searchableDate : new Date(), listPrice : 1950)
		def lease2 = new Lease(leaseStatus : LeaseStatus.OPEN, searchableDate : new Date(), listPrice : 1500)
		def lease3 = new Lease(leaseStatus : LeaseStatus.OPEN, searchableDate : new Date(), listPrice : 1000)
		
		def unit = new Unit(currentLease: lease1, number : "101A", bathrooms : 1, bedrooms : 1)
		def unit3 = new Unit(currentLease: lease3, number : "101B", bathrooms : 1, bedrooms : 2)
		
		def unit2 = new Unit(currentLease: lease2, number : "201A", bathrooms : 1, bedrooms : 1)

		
		property1.addToUnits(unit);
		property1.addToUnits(unit3);
		property2.addToUnits(unit2);

		property1.setManager(newUser);
		property2.setManager(newUser);
		unit.setOwner(newUser);
		unit2.setOwner(newUser);
		unit3.setOwner(newUser);
		
		newUser.save(flush : true, failOnError : true);
		property1.save(flush : true, failOnError : true);
		property2.save(flush : true, failOnError : true);
		
		SecUserSecRole.create(newUser, userRole);
				
    }
    def destroy = {
    }
}
