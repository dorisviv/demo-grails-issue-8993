 
<%@ page import="fims.Campus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'campus.label', default: 'Campus')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-campus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-campus" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'campus.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="mapImage" title="${message(code: 'campus.mapImage.label', default: 'Map Image')}" />
					
						<g:sortableColumn property="mapImageDate" title="${message(code: 'campus.mapImageDate.label', default: 'Map Image Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${campusInstanceList}" status="i" var="campusInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${campusInstance.id}">${fieldValue(bean: campusInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: campusInstance, field: "mapImage")}</td>
					
						<td><g:formatDate date="${campusInstance.mapImageDate}" /></td>
						%{--Doris: next two lines added 4/21/2015 to render display-String property in manyToOne and oneToOne relationships --}%
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${campusInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
