
<%@ page import="fims.Floor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'floor.label', default: 'Floor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-floor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-floor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list floor">
			
				<g:if test="${floorInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="floor.image.label" default="Image" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${floorInstance?.imageDate}">
				<li class="fieldcontain">
					<span id="imageDate-label" class="property-label"><g:message code="floor.imageDate.label" default="Image Date" /></span>
					
						<span class="property-value" aria-labelledby="imageDate-label"><g:formatDate date="${floorInstance?.imageDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${floorInstance?.building}">
				<li class="fieldcontain">
					<span id="building-label" class="property-label"><g:message code="floor.building.label" default="Building" /></span>
					
						<span class="property-value" aria-labelledby="building-label"><g:link controller="building" action="show" id="${floorInstance?.building?.id}">${floorInstance?.building?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
					
				</li>
				</g:if>
			
				<g:if test="${floorInstance?.floorDescr}">
				<li class="fieldcontain">
					<span id="floorDescr-label" class="property-label"><g:message code="floor.floorDescr.label" default="Floor Descr" /></span>
					
						<span class="property-value" aria-labelledby="floorDescr-label"><g:link controller="floorDescr" action="show" id="${floorInstance?.floorDescr?.id}">${floorInstance?.floorDescr?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
					
				</li>
				</g:if>
			
				<g:if test="${floorInstance?.spaces}">
				<li class="fieldcontain">
					<span id="spaces-label" class="property-label"><g:message code="floor.spaces.label" default="Spaces" /></span>
					
						<g:each in="${floorInstance.spaces}" var="s">
						<span class="property-value" aria-labelledby="spaces-label"><g:link controller="space" action="show" id="${s.id}">${s?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:floorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${floorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
