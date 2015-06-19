 
<%@ page import="fims.Institution" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-institution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-institution" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'institution.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="ficeCode" title="${message(code: 'institution.ficeCode.label', default: 'Fice Code')}" />
					
						<th><g:message code="institution.address.label" default="Address" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${institutionInstanceList}" status="i" var="institutionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${institutionInstance.id}">${fieldValue(bean: institutionInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: institutionInstance, field: "ficeCode")}</td>
					
						<td>${institutionInstance?.address?.displayString?.encodeAsHTML()}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${institutionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
