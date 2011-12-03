

<%@ page import="com.flatdigs.model.Property" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'property.label', default: 'Property')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${propertyInstance}">
            <div class="errors">
                <g:renderErrors bean="${propertyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${propertyInstance?.id}" />
                <g:hiddenField name="version" value="${propertyInstance?.version}" />
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
                                  <label for="zip"><g:message code="property.zip.label" default="Zip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'zip', 'errors')}">
                                    <g:textField name="zip" value="${propertyInstance?.zip}" />
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
                                    <g:select name="state.id" from="${com.flatdigs.model.util.State.list()}" optionKey="id" value="${propertyInstance?.state?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="opened"><g:message code="property.opened.label" default="Opened" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'opened', 'errors')}">
                                    <g:datePicker name="opened" precision="day" value="${propertyInstance?.opened}" default="none" noSelection="['': '']" />
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
                                  <label for="manager"><g:message code="property.manager.label" default="Manager" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'manager', 'errors')}">
                                    <g:select name="manager.id" from="${com.flatdigs.auth.User.list()}" optionKey="id" value="${propertyInstance?.manager?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="units"><g:message code="property.units.label" default="Units" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: propertyInstance, field: 'units', 'errors')}">
                                    
<ul>
<g:each in="${propertyInstance?.units?}" var="u">
    <li><g:link controller="unit" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="unit" action="create" params="['property.id': propertyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'unit.label', default: 'Unit')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
