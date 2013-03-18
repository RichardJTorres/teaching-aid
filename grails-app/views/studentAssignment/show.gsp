
<%@ page import="teaching.aid.StudentAssignment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'studentAssignment.label', default: 'StudentAssignment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-studentAssignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-studentAssignment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list studentAssignment">
			
				<g:if test="${studentAssignmentInstance?.assignment}">
				<li class="fieldcontain">
					<span id="assignment-label" class="property-label"><g:message code="studentAssignment.assignment.label" default="Assignment" /></span>
					
						<span class="property-value" aria-labelledby="assignment-label"><g:link controller="assignment" action="show" id="${studentAssignmentInstance?.assignment?.id}">${studentAssignmentInstance?.assignment?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentAssignmentInstance?.assignmentGrade}">
				<li class="fieldcontain">
					<span id="assignmentGrade-label" class="property-label"><g:message code="studentAssignment.assignmentGrade.label" default="Assignment Grade" /></span>
					
						<span class="property-value" aria-labelledby="assignmentGrade-label"><g:fieldValue bean="${studentAssignmentInstance}" field="assignmentGrade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentAssignmentInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="studentAssignment.student.label" default="Student" /></span>
					
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${studentAssignmentInstance?.student?.id}">${studentAssignmentInstance?.student?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${studentAssignmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${studentAssignmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
