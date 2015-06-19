<%@ page import="fims.LocationCode" %>



<div class="fieldcontain ${hasErrors(bean: locationCodeInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="locationCode.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="1" pattern="${locationCodeInstance.constraints.code.matches}" required="" value="${locationCodeInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: locationCodeInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="locationCode.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="30" pattern="${locationCodeInstance.constraints.description.matches}" required="" value="${locationCodeInstance?.description}"/>

</div>

