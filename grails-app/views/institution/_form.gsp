<%@ page import="fims.Institution" %>



<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="institution.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" pattern="${institutionInstance.constraints.name.matches}" required="" value="${institutionInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'ficeCode', 'error')} required">
	<label for="ficeCode">
		<g:message code="institution.ficeCode.label" default="Fice Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ficeCode" maxlength="6" pattern="${institutionInstance.constraints.ficeCode.matches}" required="" value="${institutionInstance?.ficeCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="institution.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="address" name="address.id" from="${fims.Address.list()}" optionKey="id" optionValue="displayString" required="" value="${institutionInstance?.address?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: institutionInstance, field: 'campuses', 'error')} ">
	<label for="campuses">
		<g:message code="institution.campuses.label" default="Campuses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${institutionInstance?.campuses?}" var="c">
    <li><g:link controller="campus" action="show" id="${c.id}">${c?.displayString?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="campus" action="create" params="['institution.id': institutionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'campus.label', default: 'Campus')])}</g:link>
</li>
</ul>


</div>

