<%@ page import="fims.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street1', 'error')} required">
	<label for="street1">
		<g:message code="address.street1.label" default="Street1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="street1" maxlength="100" pattern="${addressInstance.constraints.street1.matches}" required="" value="${addressInstance?.street1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street2', 'error')} ">
	<label for="street2">
		<g:message code="address.street2.label" default="Street2" />
		
	</label>
	<g:textField name="street2" maxlength="100" pattern="${addressInstance.constraints.street2.matches}" value="${addressInstance?.street2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" maxlength="100" pattern="${addressInstance.constraints.city.matches}" required="" value="${addressInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="address.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" maxlength="2" pattern="${addressInstance.constraints.state.matches}" required="" value="${addressInstance?.state}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'zip', 'error')} required">
	<label for="zip">
		<g:message code="address.zip.label" default="Zip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zip" pattern="${addressInstance.constraints.zip.matches}" required="" value="${addressInstance?.zip}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'locationCode', 'error')} required">
	<label for="locationCode">
		<g:message code="address.locationCode.label" default="Location Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="locationCode" name="locationCode.id" from="${fims.LocationCode.list()}" optionKey="id" optionValue="displayString" required="" value="${addressInstance?.locationCode?.id}" class="many-to-one"/>

</div>

