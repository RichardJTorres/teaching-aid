
<%@ page import="teaching.aid.Assignment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assignment.label', default: 'Assignment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-assignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-assignment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list assignment">
			
				<g:if test="${assignmentInstance?.assignmentDate}">
				<li class="fieldcontain">
					<span id="assignmentDate-label" class="property-label"><g:message code="assignment.assignmentDate.label" default="Assignment Date" /></span>
					
						<span class="property-value" aria-labelledby="assignmentDate-label"><g:formatDate date="${assignmentInstance?.assignmentDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.assignmentNumber}">
				<li class="fieldcontain">
					<span id="assignmentNumber-label" class="property-label"><g:message code="assignment.assignmentNumber.label" default="Assignment Number" /></span>
					
						<span class="property-value" aria-labelledby="assignmentNumber-label"><g:fieldValue bean="${assignmentInstance}" field="assignmentNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.grade}">
				<li class="fieldcontain">
					<span id="grade-label" class="property-label"><g:message code="assignment.grade.label" default="Grade" /></span>
					
						<span class="property-value" aria-labelledby="grade-label"><g:fieldValue bean="${assignmentInstance}" field="grade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="assignment.student.label" default="Student" /></span>
					
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${assignmentInstance?.student?.id}">${assignmentInstance?.student?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${assignmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${assignmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
