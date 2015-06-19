<%@ page import="fims.Space" %>



<div class="fieldcontain ${hasErrors(bean: spaceInstance, field: 'spaceNum', 'error')} required">
	<label for="spaceNum">
		<g:message code="space.spaceNum.label" default="Space Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="spaceNum" maxlength="10" pattern="${spaceInstance.constraints.spaceNum.matches}" required="" value="${spaceInstance?.spaceNum}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: spaceInstance, field: 'area', 'error')} required">
	<label for="area">
		<g:message code="space.area.label" default="Area" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="area" value="${fieldValue(bean: spaceInstance, field: 'area')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: spaceInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="space.image.label" default="Image" />
		
	</label>
	<input type="file" id="image" name="image" />

</div>

<div class="fieldcontain ${hasErrors(bean: spaceInstance, field: 'imageDate', 'error')} ">
	<label for="imageDate">
		<g:message code="space.imageDate.label" default="Image Date" />
		
	</label>
	<g:datePicker name="imageDate" precision="day"  value="${spaceInstance?.imageDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: spaceInstance, field: 'capacity', 'error')} required">
	<label for="capacity">
		<g:message code="space.capacity.label" default="Capacity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="capacity" type="number" value="${spaceInstance.capacity}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: spaceInstance, field: 'floor', 'error')} required">
	<label for="floor">
		<g:message code="space.floor.label" default="Floor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="floor" name="floor.id" from="${fims.Floor.list()}" optionKey="id" optionValue="displayString" required="" value="${spaceInstance?.floor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: spaceInstance, field: 'seatCapacity', 'error')} required">
	<label for="seatCapacity">
		<g:message code="space.seatCapacity.label" default="Seat Capacity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="seatCapacity" type="number" value="${spaceInstance.seatCapacity}" required=""/>

</div>

