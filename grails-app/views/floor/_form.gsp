<%@ page import="fims.Floor" %>



<div class="fieldcontain ${hasErrors(bean: floorInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="floor.image.label" default="Image" />
		
	</label>
	<input type="file" id="image" name="image" />

</div>

<div class="fieldcontain ${hasErrors(bean: floorInstance, field: 'imageDate', 'error')} ">
	<label for="imageDate">
		<g:message code="floor.imageDate.label" default="Image Date" />
		
	</label>
	<g:datePicker name="imageDate" precision="day"  value="${floorInstance?.imageDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: floorInstance, field: 'building', 'error')} required">
	<label for="building">
		<g:message code="floor.building.label" default="Building" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="building" name="building.id" from="${fims.Building.list()}" optionKey="id" optionValue="displayString" required="" value="${floorInstance?.building?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: floorInstance, field: 'floorDescr', 'error')} required">
	<label for="floorDescr">
		<g:message code="floor.floorDescr.label" default="Floor Descr" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="floorDescr" name="floorDescr.id" from="${fims.FloorDescr.list()}" optionKey="id" optionValue="displayString" required="" value="${floorInstance?.floorDescr?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: floorInstance, field: 'spaces', 'error')} ">
	<label for="spaces">
		<g:message code="floor.spaces.label" default="Spaces" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${floorInstance?.spaces?}" var="s">
    <li><g:link controller="space" action="show" id="${s.id}">${s?.displayString?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="space" action="create" params="['floor.id': floorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'space.label', default: 'Space')])}</g:link>
</li>
</ul>


</div>

