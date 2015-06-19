
<%@ page import="fims.Building" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'building.label', default: 'Building')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-building" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-building" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list building">
			
				<g:if test="${buildingInstance?.bldgCode}">
				<li class="fieldcontain">
					<span id="bldgCode-label" class="property-label"><g:message code="building.bldgCode.label" default="Bldg Code" /></span>
					
						<span class="property-value" aria-labelledby="bldgCode-label"><g:fieldValue bean="${buildingInstance}" field="bldgCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buildingInstance?.campus}">
				<li class="fieldcontain">
					<span id="campus-label" class="property-label"><g:message code="building.campus.label" default="Campus" /></span>
					
						<span class="property-value" aria-labelledby="campus-label"><g:link controller="campus" action="show" id="${buildingInstance?.campus?.id}">${buildingInstance?.campus?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
					
				</li>
				</g:if>
			
				<g:if test="${buildingInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="building.image.label" default="Image" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${buildingInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="building.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show" id="${buildingInstance?.address?.id}">${buildingInstance?.address?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
					
				</li>
				</g:if>
			
				<g:if test="${buildingInstance?.floors}">
				<li class="fieldcontain">
					<span id="floors-label" class="property-label"><g:message code="building.floors.label" default="Floors" /></span>
					
						<g:each in="${buildingInstance.floors}" var="f">
						<span class="property-value" aria-labelledby="floors-label"><g:link controller="floor" action="show" id="${f.id}">${f?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:buildingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${buildingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
