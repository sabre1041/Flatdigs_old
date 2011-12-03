<html>
<head>

</head>

<body>
	<div class="nav">
		<span class="menuButton"><g:link class="list" controller="property" action="list">Properties List</g:link></span>
		<span class="menuButton"><g:link class="create" controller="unit" action="create">Create New Unit</g:link></span>
</div>

<div>
   <g:if test="${flash.message}">
  	 <div class="message">${flash.message}</div>
   </g:if>
<h1 style="margin-left:10px">Units</h1>
<g:render template="individualUnit" collection="${units}" />
<g:if test="${units.isEmpty()}">
<div style="margin:10px">You Have No Units</div>
</g:if>
</div>
</body>

</html>