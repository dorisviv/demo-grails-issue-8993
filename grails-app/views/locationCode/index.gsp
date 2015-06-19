 
<%@ page import="fims.LocationCode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'locationCode.label', default: 'LocationCode')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-locationCode" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-locationCode" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'locationCode.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'locationCode.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${locationCodeInstanceList}" status="i" var="locationCodeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${locationCodeInstance.id}">${fieldValue(bean: locationCodeInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: locationCodeInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${locationCodeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
