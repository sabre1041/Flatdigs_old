<div style="border:1px solid;margin:10px">
<div style="border-bottom:1px solid;font-weight:bold">

 ${unit.number}

	<div align="right">
		<%-- g:link controller="unit" action="show" id="${unit.id}">View</g:link --%>
		<g:link controller="unit" action="delete" id="${unit.id}" onClick="return(confirm('Are you sure you want to delete this Unit?'));">Delete</g:link>
		
	</div>
</div>
Unit Type: ${unit.unitType }<br/>
Bedrooms: ${unit.bedrooms }<br />
Bathrooms: ${unit.bathrooms }<br />
</div>