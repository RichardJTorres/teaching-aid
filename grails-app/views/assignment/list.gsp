
<%@ page import="teaching.aid.Assignment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assignment.label', default: 'Assignment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-assignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-assignment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="assignmentDate" title="${message(code: 'assignment.assignmentDate.label', default: 'Assignment Date')}" />
					
						<g:sortableColumn property="assignmentNumber" title="${message(code: 'assignment.assignmentName.label', default: 'Assignment Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${assignmentInstanceList}" status="i" var="assignmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${assignmentInstance.id}">${fieldValue(bean: assignmentInstance, field: "assignmentDate")}</g:link></td>
					
						<td>${fieldValue(bean: assignmentInstance, field: "assignmentName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${assignmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
