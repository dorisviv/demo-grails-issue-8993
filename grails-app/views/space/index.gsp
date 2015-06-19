 
<%@ page import="fims.Space" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'space.label', default: 'Space')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-space" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-space" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="spaceNum" title="${message(code: 'space.spaceNum.label', default: 'Space Num')}" />
					
						<g:sortableColumn property="area" title="${message(code: 'space.area.label', default: 'Area')}" />
					
						<g:sortableColumn property="image" title="${message(code: 'space.image.label', default: 'Image')}" />
					
						<g:sortableColumn property="imageDate" title="${message(code: 'space.imageDate.label', default: 'Image Date')}" />
					
						<g:sortableColumn property="capacity" title="${message(code: 'space.capacity.label', default: 'Capacity')}" />
					
						<th><g:message code="space.floor.label" default="Floor" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${spaceInstanceList}" status="i" var="spaceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${spaceInstance.id}">${fieldValue(bean: spaceInstance, field: "spaceNum")}</g:link></td>
					
						<td>${fieldValue(bean: spaceInstance, field: "area")}</td>
					
						<td>${fieldValue(bean: spaceInstance, field: "image")}</td>
					
						<td><g:formatDate date="${spaceInstance.imageDate}" /></td>
						%{--Doris: next two lines added 4/21/2015 to render display-String property in manyToOne and oneToOne relationships --}%
					
						<td>${fieldValue(bean: spaceInstance, field: "capacity")}</td>
					
						<td>${spaceInstance?.floor?.displayString?.encodeAsHTML()}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${spaceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
