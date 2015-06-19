
<%@ page import="fims.Campus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'campus.label', default: 'Campus')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-campus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-campus" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list campus">
			
				<g:if test="${campusInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="campus.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${campusInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campusInstance?.mapImage}">
				<li class="fieldcontain">
					<span id="mapImage-label" class="property-label"><g:message code="campus.mapImage.label" default="Map Image" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${campusInstance?.mapImageDate}">
				<li class="fieldcontain">
					<span id="mapImageDate-label" class="property-label"><g:message code="campus.mapImageDate.label" default="Map Image Date" /></span>
					
						<span class="property-value" aria-labelledby="mapImageDate-label"><g:formatDate date="${campusInstance?.mapImageDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${campusInstance?.buildings}">
				<li class="fieldcontain">
					<span id="buildings-label" class="property-label"><g:message code="campus.buildings.label" default="Buildings" /></span>
					
						<g:each in="${campusInstance.buildings}" var="b">
						<span class="property-value" aria-labelledby="buildings-label"><g:link controller="building" action="show" id="${b.id}">${b?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:campusInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${campusInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
