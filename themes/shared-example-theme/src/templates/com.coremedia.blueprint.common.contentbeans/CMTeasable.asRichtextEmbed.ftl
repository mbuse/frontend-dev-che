<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.contentbeans.CMTeasable" -->
<#-- @ftlvariable name="att_class" type="java.lang.String" -->

<#assign additionalCssClasses=att_class!""/>

</p>
<div class="cm-richtext-embedded cm-richtext-embedded--teasable ${additionalCssClasses}">
  <@cm.include self=self view="asLeftRightBanner" />
</div>
<p>
