
<%@ page import="com.flatdigs.model.Property" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'property.label', default: 'Property')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" controller="unit" action="create" id="${propertyInstance.id}">Create New Unit</g:link></span>
        </div>
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
    </body>
</html>
