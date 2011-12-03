

<%@ page import="com.flatdigs.model.Unit" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'unit.label', default: 'Unit')}" />
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
            <g:hasErrors bean="${unitInstance}">
            <div class="errors">
                <g:renderErrors bean="${unitInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${unitInstance?.id}" />
                <g:hiddenField name="version" value="${unitInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="unitType"><g:message code="unit.unitType.label" default="Unit Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: unitInstance, field: 'unitType', 'errors')}">
                                    <g:select name="unitType.id" from="${com.flatdigs.model.UnitType.list()}" optionKey="id" value="${unitInstance?.unitType?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bedrooms"><g:message code="unit.bedrooms.label" default="Bedrooms" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: unitInstance, field: 'bedrooms', 'errors')}">
                                    <g:textField name="bedrooms" value="${fieldValue(bean: unitInstance, field: 'bedrooms')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bathrooms"><g:message code="unit.bathrooms.label" default="Bathrooms" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: unitInstance, field: 'bathrooms', 'errors')}">
                                    <g:textField name="bathrooms" value="${fieldValue(bean: unitInstance, field: 'bathrooms')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="number"><g:message code="unit.number.label" default="Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: unitInstance, field: 'number', 'errors')}">
                                    <g:textField name="number" value="${unitInstance?.number}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="property"><g:message code="unit.property.label" default="Property" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: unitInstance, field: 'property', 'errors')}">
                                    <g:select name="property.id" from="${com.flatdigs.model.Property.list()}" optionKey="id" value="${unitInstance?.property?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="owner"><g:message code="unit.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: unitInstance, field: 'owner', 'errors')}">
                                    <g:select name="owner.id" from="${com.flatdigs.auth.User.list()}" optionKey="id" value="${unitInstance?.owner?.id}"  />
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
