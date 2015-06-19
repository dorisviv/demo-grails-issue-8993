<%@ page import="fims.Campus" %>



<div class="fieldcontain ${hasErrors(bean: campusInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="campus.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" pattern="${campusInstance.constraints.name.matches}" required="" value="${campusInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: campusInstance, field: 'mapImage', 'error')} ">
	<label for="mapImage">
		<g:message code="campus.mapImage.label" default="Map Image" />
		
	</label>
	<input type="file" id="mapImage" name="mapImage" />

</div>

<div class="fieldcontain ${hasErrors(bean: campusInstance, field: 'mapImageDate', 'error')} ">
	<label for="mapImageDate">
		<g:message code="campus.mapImageDate.label" default="Map Image Date" />
		
	</label>
	<g:datePicker name="mapImageDate" precision="day"  value="${campusInstance?.mapImageDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: campusInstance, field: 'buildings', 'error')} ">
	<label for="buildings">
		<g:message code="campus.buildings.label" default="Buildings" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${campusInstance?.buildings?}" var="b">
    <li><g:link controller="building" action="show" id="${b.id}">${b?.displayString?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="building" action="create" params="['campus.id': campusInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'building.label', default: 'Building')])}</g:link>
</li>
</ul>


</div>

