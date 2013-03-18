
<%@ page import="teaching.aid.StudentAssignment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studentAssignment.label', default: 'StudentAssignment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-studentAssignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-studentAssignment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="studentAssignment.assignment.label" default="Assignment" /></th>
					
						<g:sortableColumn property="assignmentGrade" title="${message(code: 'studentAssignment.assignmentGrade.label', default: 'Assignment Grade')}" />
					
						<th><g:message code="studentAssignment.student.label" default="Student" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${studentAssignmentInstanceList}" status="i" var="studentAssignmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${studentAssignmentInstance.id}">${fieldValue(bean: studentAssignmentInstance, field: "assignment")}</g:link></td>
					
						<td>${fieldValue(bean: studentAssignmentInstance, field: "assignmentGrade")}</td>
					
						<td>${fieldValue(bean: studentAssignmentInstance, field: "student")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${studentAssignmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
