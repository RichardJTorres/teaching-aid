<%@ page import="teaching.aid.StudentAssignment" %>



<div class="fieldcontain ${hasErrors(bean: studentAssignmentInstance, field: 'assignment', 'error')} required">
	<label for="assignment">
		<g:message code="studentAssignment.assignment.label" default="Assignment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="assignment" name="assignment.id" from="${teaching.aid.Assignment.list()}" optionKey="id" required="" value="${studentAssignmentInstance?.assignment?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentAssignmentInstance, field: 'assignmentGrade', 'error')} required">
	<label for="assignmentGrade">
		<g:message code="studentAssignment.assignmentGrade.label" default="Assignment Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="assignmentGrade" value="${fieldValue(bean: studentAssignmentInstance, field: 'assignmentGrade')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentAssignmentInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="studentAssignment.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${teaching.aid.Student.list()}" optionKey="id" required="" value="${studentAssignmentInstance?.student?.id}" class="many-to-one"/>
</div>

