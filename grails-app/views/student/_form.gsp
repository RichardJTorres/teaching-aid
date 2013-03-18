<%@ page import="teaching.aid.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'assignment', 'error')} ">
	<label for="assignment">
		<g:message code="student.assignment.label" default="Assignment" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.assignment?}" var="a">
    <li><g:link controller="assignment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="assignment" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'assignment.label', default: 'Assignment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="student.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${studentInstance?.name}"/>
</div>

