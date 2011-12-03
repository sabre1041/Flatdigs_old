<%@ page import="com.flatdigs.model.Property" %>
<%@ page import="java.util.Calendar"%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'property.label', default: 'Property')}" />
        <title>Create New Property</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list">Back to Property List</g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${propertyInstance}">
            <div class="errors">
                <g:renderErrors bean="${propertyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="update" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="property.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${propertyInstance?.name}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="floors"><g:message code="property.floors.label" default="Floors" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'floors', 'errors')}">
                                    <g:textField name="floors" value="${fieldValue(bean: propertyInstance, field: 'floors')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="streetNumber"><g:message code="property.streetNumber.label" default="Street Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'streetNumber', 'errors')}">
                                    <g:textField name="streetNumber" value="${propertyInstance?.streetNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="streetName"><g:message code="property.streetName.label" default="Street Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'streetName', 'errors')}">
                                    <g:textField name="streetName" value="${propertyInstance?.streetName}" />
                                </td>
                            </tr>                       
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city"><g:message code="property.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${propertyInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state"><g:message code="property.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'state', 'errors')}">
                                    <g:select noSelection="[null :'Select State']" optionValue="name" name="state.id" from="${com.flatdigs.model.util.State.list()}" optionKey="id" value="${propertyInstance?.state?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="opened">Year Built</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'opened', 'errors')}">
                                    <g:datePicker name="opened" precision="year" value="${propertyInstance?.opened}" default="none" noSelection="['': 'Select Year']" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zip"><g:message code="property.zip.label" default="Zip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'zip', 'errors')}">
                                    <g:textField name="zip" value="${propertyInstance?.zip}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="property.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${propertyInstance?.description}" />
                                </td>
                            </tr>
                        
                                                </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
