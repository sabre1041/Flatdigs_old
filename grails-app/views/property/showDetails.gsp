<%@page sitemeshPreprocess="false"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        	<style type="text/css">
        	
        	
        table {
        	color:white;
        	margin:10px;
        	width:280px;
        }
        
        
        </style>
    </head>
    <body>
    <h1 style="color:#FFFFFF;padding:10px;margin-left:20px">${propertyInstance?.streetNumber} ${propertyInstance?.streetName}</h1>
    <div style="padding-top:20px">
    
    <table>
    <g:if test="${propertyInstance.name!=null}">
    <tr><td>Building name</td><td>${propertyInstance?.name}</td>
    </g:if>
    <tr><td>Property Type</td><td>${propertyInstance?.propertyType}</td></tr>
    <tr><td>Address</td><td>${propertyInstance?.streetNumber} ${propertyInstance?.streetName}</td>
    <tr><td>City</td><td>${propertyInstance?.city}</td></tr>
    <tr><td>State</td><td>${propertyInstance?.state}</td></tr>
    <tr><td>Zip</td><td>${propertyInstance?.zip}</td></tr>  
    </table>
    
    <table style="margin-top:20px" id="unitTable">
    
    <tr><td colspan="4" style="font-size:12px;text-align:center">Units</td>
    <tr><td>Unit #</td><td>List Price</td><td>Bedrooms</td><td>Bathroms</td>
    <g:each in="${propertyInstance?.units}" var="unit">
    <tr>
    	<td>${unit?.number}</td>
    	<td><g:formatNumber number="${unit?.currentLease?.listPrice }" type="currency" currencyCode="USD" /></td>
    	<td>${unit?.bedrooms }</td>
    	<td>${unit?.bathrooms }</td>
    </tr>
    
    
    </g:each>
    
    
    </table>
    
    </div>
    <%--
        <div>
            <h1>Property Details</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    <g:if test="${propertyInstance.name!=null}">
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="property.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: propertyInstance, field: "name")}</td>
                            
                        </tr>
                     </g:if>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="property.streetNumber.label" default="Street Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: propertyInstance, field: "streetNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="property.streetName.label" default="Street Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: propertyInstance, field: "streetName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="property.zip.label" default="Zip" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: propertyInstance, field: "zip")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="property.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: propertyInstance, field: "city")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="property.state.label" default="State" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: propertyInstance, field: "state")}</td>
                            
                        </tr>
                    
                    	<g:if test="${propertyInstance.opened!=null}">
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="property.opened.label" default="Opened" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${propertyInstance?.opened}" /></td>
                            
                        </tr>
                        </g:if>
                    
                    	<g:if test="${propertyInstance.description!=null}">
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="property.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: propertyInstance, field: "description")}</td>
                            
                        </tr>
                        </g:if>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="property.floors.label" default="Floors" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: propertyInstance, field: "floors")}</td>
                            
                        </tr>
                                        
                    </tbody>
                </table>
            </div>
            <br/>
            <h1>Unit Details</h1>
            <g:render template="/unit/individualUnit" collection="${propertyInstance.units}" />
			<g:if test="${propertyInstance.units.isEmpty()}">
			<div style="margin:10px">You Have No Units</div>
			</g:if>
            
            
            
            <!--div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${propertyInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div-->
           
        </div>
         --%>
    </body>
</html>
