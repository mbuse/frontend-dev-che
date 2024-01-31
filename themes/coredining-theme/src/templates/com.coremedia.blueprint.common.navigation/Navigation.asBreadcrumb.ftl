<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.navigation.Navigation" -->
<#list self.navigationPathList![] as segment>
  <@cm.include self=segment view="asLink" />
  <#sep> &gt;
</#list>
