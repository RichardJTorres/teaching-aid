<%@ page import="teaching.aid.Assignment" %>



<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'assignmentDate', 'error')} required">
	<label for="assignmentDate">
		<g:message code="assignment.assignmentDate.label" default="Assignment Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="assignmentDate" precision="day"  value="${assignmentInstance?.assignmentDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'assignmentNumber', 'error')} ">
	<label for="assignmentNumber">
		<g:message code="assignment.assignmentNumber.label" default="Assignment Number" />
		
	</label>
	<g:textField name="assignmentNumber" value="${assignmentInstance?.assignmentNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'grade', 'error')} required">
	<label for="grade">
		<g:message code="assignment.grade.label" default="Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="grade" value="${fieldValue(bean: assignmentInstance, field: 'grade')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="assignment.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.name" from="${teaching.aid.Student.list()}" optionKey="id" required="" value="${assignmentInstance?.student?.id}" class="many-to-one"/>
</div>

