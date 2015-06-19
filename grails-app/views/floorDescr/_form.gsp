<%@ page import="fims.FloorDescr" %>



<div class="fieldcontain ${hasErrors(bean: floorDescrInstance, field: 'floorCode', 'error')} required">
	<label for="floorCode">
		<g:message code="floorDescr.floorCode.label" default="Floor Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="floorCode" maxlength="2" pattern="${floorDescrInstance.constraints.floorCode.matches}" required="" value="${floorDescrInstance?.floorCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: floorDescrInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="floorDescr.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" maxlength="20" pattern="${floorDescrInstance.constraints.description.matches}" required="" value="${floorDescrInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: floorDescrInstance, field: 'floors', 'error')} ">
	<label for="floors">
		<g:message code="floorDescr.floors.label" default="Floors" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${floorDescrInstance?.floors?}" var="f">
    <li><g:link controller="floor" action="show" id="${f.id}">${f?.displayString?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="floor" action="create" params="['floorDescr.id': floorDescrInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'floor.label', default: 'Floor')])}</g:link>
</li>
</ul>


</div>

