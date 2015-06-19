
<%@ page import="fims.FloorDescr" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'floorDescr.label', default: 'FloorDescr')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-floorDescr" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-floorDescr" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list floorDescr">
			
				<g:if test="${floorDescrInstance?.floorCode}">
				<li class="fieldcontain">
					<span id="floorCode-label" class="property-label"><g:message code="floorDescr.floorCode.label" default="Floor Code" /></span>
					
						<span class="property-value" aria-labelledby="floorCode-label"><g:fieldValue bean="${floorDescrInstance}" field="floorCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${floorDescrInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="floorDescr.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${floorDescrInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${floorDescrInstance?.floors}">
				<li class="fieldcontain">
					<span id="floors-label" class="property-label"><g:message code="floorDescr.floors.label" default="Floors" /></span>
					
						<g:each in="${floorDescrInstance.floors}" var="f">
						<span class="property-value" aria-labelledby="floors-label"><g:link controller="floor" action="show" id="${f.id}">${f?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:floorDescrInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${floorDescrInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
