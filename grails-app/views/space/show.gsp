
<%@ page import="fims.Space" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'space.label', default: 'Space')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-space" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-space" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list space">
			
				<g:if test="${spaceInstance?.spaceNum}">
				<li class="fieldcontain">
					<span id="spaceNum-label" class="property-label"><g:message code="space.spaceNum.label" default="Space Num" /></span>
					
						<span class="property-value" aria-labelledby="spaceNum-label"><g:fieldValue bean="${spaceInstance}" field="spaceNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${spaceInstance?.area}">
				<li class="fieldcontain">
					<span id="area-label" class="property-label"><g:message code="space.area.label" default="Area" /></span>
					
						<span class="property-value" aria-labelledby="area-label"><g:fieldValue bean="${spaceInstance}" field="area"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${spaceInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="space.image.label" default="Image" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${spaceInstance?.imageDate}">
				<li class="fieldcontain">
					<span id="imageDate-label" class="property-label"><g:message code="space.imageDate.label" default="Image Date" /></span>
					
						<span class="property-value" aria-labelledby="imageDate-label"><g:formatDate date="${spaceInstance?.imageDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${spaceInstance?.capacity}">
				<li class="fieldcontain">
					<span id="capacity-label" class="property-label"><g:message code="space.capacity.label" default="Capacity" /></span>
					
						<span class="property-value" aria-labelledby="capacity-label"><g:fieldValue bean="${spaceInstance}" field="capacity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${spaceInstance?.floor}">
				<li class="fieldcontain">
					<span id="floor-label" class="property-label"><g:message code="space.floor.label" default="Floor" /></span>
					
						<span class="property-value" aria-labelledby="floor-label"><g:link controller="floor" action="show" id="${spaceInstance?.floor?.id}">${spaceInstance?.floor?.displayString?.encodeAsHTML()}</g:link></span> %{--Doris: added displayString? 4/22/2015--}%
					
				</li>
				</g:if>
			
				<g:if test="${spaceInstance?.seatCapacity}">
				<li class="fieldcontain">
					<span id="seatCapacity-label" class="property-label"><g:message code="space.seatCapacity.label" default="Seat Capacity" /></span>
					
						<span class="property-value" aria-labelledby="seatCapacity-label"><g:fieldValue bean="${spaceInstance}" field="seatCapacity"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:spaceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${spaceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
