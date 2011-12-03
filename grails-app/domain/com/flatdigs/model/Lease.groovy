package com.flatdigs.model

class Lease {

	
	static belongsTo = [ unit : Unit]
	 
	public enum LeaseStatus{
		OPEN("Open"),
		CLOSED("Closed"),
		EXPIRED("Expired")
 
		final String value;
 
		LeaseStatus(String value) {
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
    static constraints = {
		actualPrice nullable : true
		availabilityDate nullable : true
		leaseStart nullable : true
		leaseEnd nullable : true
    }
	
	Date availabilityDate
	Date searchableDate
	BigDecimal listPrice
	//Showings showings
	LeaseStatus leaseStatus
	BigDecimal actualPrice
	
	Date leaseStart
	Date leaseEnd
	
}
