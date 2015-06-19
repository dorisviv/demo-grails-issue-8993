 
<%@ page import="fims.FloorDescr" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'floorDescr.label', default: 'FloorDescr')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-floorDescr" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-floorDescr" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="floorCode" title="${message(code: 'floorDescr.floorCode.label', default: 'Floor Code')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'floorDescr.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${floorDescrInstanceList}" status="i" var="floorDescrInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${floorDescrInstance.id}">${fieldValue(bean: floorDescrInstance, field: "floorCode")}</g:link></td>
					
						<td>${fieldValue(bean: floorDescrInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${floorDescrInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
