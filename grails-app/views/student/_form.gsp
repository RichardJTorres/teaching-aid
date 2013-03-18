<%@ page import="teaching.aid.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'grade', 'error')} required">
	<label for="grade">
		<g:message code="student.grade.label" default="Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="grade" value="${fieldValue(bean: studentInstance, field: 'grade')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="student.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${studentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'studentAssignment', 'error')} ">
	<label for="studentAssignment">
		<g:message code="student.studentAssignment.label" default="Student Assignment" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.studentAssignment?}" var="s">
    <li><g:link controller="studentAssignment" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="studentAssignment" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'studentAssignment.label', default: 'StudentAssignment')])}</g:link>
</li>
</ul>

</div>

