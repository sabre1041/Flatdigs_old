<div style="border:1px solid;margin:10px">
<div style="border-bottom:1px solid;font-weight:bold">

 ${property.streetNumber } ${property.streetName }

	<div align="right">
		<g:link controller="property" action="show" id="${property.id}">View</g:link>
		<g:link controller="property" action="delete" id="${property.id}" onClick="return(confirm('Are you sure you want to delete the property?'));">Delete</g:link>
		
	</div>
</div>
Street Number: ${property.streetNumber }<br/>
Street Name: ${property.streetName }<br />
City: ${property.city }<br />
State: ${property.state }<br />
Zip code: ${property.zip }<br />
Units: ${property.units.size() }<br />

</div>