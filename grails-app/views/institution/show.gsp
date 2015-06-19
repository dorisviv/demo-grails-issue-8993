
<%@ page import="fims.Institution" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-institution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-institution" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list institution">
			
				<g:if test="${institutionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="institution.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${institutionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.ficeCode}">
				<li class="fieldcontain">
					<span id="ficeCode-label" class="property-label"><g:message code="institution.ficeCode.label" default="Fice Code" /></span>
					
						<span class="property-value" aria-labelledby="ficeCode-label"><g:fieldValue bean="${institutionInstance}" field="ficeCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="institution.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show" id="${institutionInstance?.address?.id}">${institutionInstance?.address?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
					
				</li>
				</g:if>
			
				<g:if test="${institutionInstance?.campuses}">
				<li class="fieldcontain">
					<span id="campuses-label" class="property-label"><g:message code="institution.campuses.label" default="Campuses" /></span>
					
						<g:each in="${institutionInstance.campuses}" var="c">
						<span class="property-value" aria-labelledby="campuses-label"><g:link controller="campus" action="show" id="${c.id}">${c?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:institutionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${institutionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
