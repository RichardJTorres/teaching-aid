<%@ page import="teaching.aid.Assignment" %>



<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'assignmentDate', 'error')} required">
	<label for="assignmentDate">
		<g:message code="assignment.assignmentDate.label" default="Assignment Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="assignmentDate" precision="day"  value="${assignmentInstance?.assignmentDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'assignmentName', 'error')} ">
	<label for="assignmentNumber">
		<g:message code="assignment.assignmentNumber.label" default="Assignment Number" />
		
	</label>
	<g:textField name="assignmentNumber" value="${assignmentInstance?.assignmentNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'studentAssignment', 'error')} ">
	<label for="studentAssignment">
		<g:message code="assignment.studentAssignment.label" default="Student Assignment" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${assignmentInstance?.studentAssignment?}" var="s">
    <li><g:link controller="studentAssignment" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="studentAssignment" action="create" params="['assignment.id': assignmentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'studentAssignment.label', default: 'StudentAssignment')])}</g:link>
</li>
</ul>

</div>

