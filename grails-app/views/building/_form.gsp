<%@ page import="fims.Building" %>



<div class="fieldcontain ${hasErrors(bean: buildingInstance, field: 'bldgCode', 'error')} required">
	<label for="bldgCode">
		<g:message code="building.bldgCode.label" default="Bldg Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bldgCode" maxlength="20" pattern="${buildingInstance.constraints.bldgCode.matches}" required="" value="${buildingInstance?.bldgCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buildingInstance, field: 'campus', 'error')} required">
	<label for="campus">
		<g:message code="building.campus.label" default="Campus" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="campus" name="campus.id" from="${fims.Campus.list()}" optionKey="id" optionValue="displayString" required="" value="${buildingInstance?.campus?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buildingInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="building.image.label" default="Image" />
		
	</label>
	<input type="file" id="image" name="image" />

</div>

<div class="fieldcontain ${hasErrors(bean: buildingInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="building.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="address" name="address.id" from="${fims.Address.list()}" optionKey="id" optionValue="displayString" required="" value="${buildingInstance?.address?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buildingInstance, field: 'floors', 'error')} ">
	<label for="floors">
		<g:message code="building.floors.label" default="Floors" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${buildingInstance?.floors?}" var="f">
    <li><g:link controller="floor" action="show" id="${f.id}">${f?.displayString?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="floor" action="create" params="['building.id': buildingInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'floor.label', default: 'Floor')])}</g:link>
</li>
</ul>


</div>

