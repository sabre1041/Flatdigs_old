<html>
<head>

</head>

<body>
	<div class="nav">
		<span class="menuButton"><g:link class="create" controller="property" action="create">Create New Property</g:link></span>
</div>

<div>
   <g:if test="${flash.message}">
  	 <div class="message">${flash.message}</div>
   </g:if>
<h1 style="margin-left:10px">Properties</h1>
<g:render template="individualProperty" collection="${properties}" />
<g:if test="${properties.isEmpty()}">
<div style="margin:10px">You Have No Properties</div>
</g:if>
</div>
</body>

</html>