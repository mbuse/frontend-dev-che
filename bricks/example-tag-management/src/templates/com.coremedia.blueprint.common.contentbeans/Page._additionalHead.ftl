<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.contentbeans.Page" -->

<#--
    Template Description:

    This template includes all CSS, javascripts, PDE files and the hook VIEW_HOOK_HEAD in the head.
    Please check the brick "generic templates" for a more detailed version.
-->

<#-- include additional css for fragment preview -->
<#if preview.isFragmentPreview()>
  <#assign fragmentPreviewCss=bp.setting(self, "fragmentPreviewCss", []) />
  <#list fragmentPreviewCss as css>
    <@cm.include self=css view="asCSSLink"/>
  </#list>
</#if>

<#-- include css -->
<#list self.css![] as css>
  <@cm.include self=css view="asCSSLink"/>
</#list>

<#-- include css with conditional comments for IE -->
<#list self.internetExplorerCss![] as css>
  <@cm.include self=css view="asCSSLink"/>
</#list>

<#-- include additional css for preview -->
<#if preview.isPreviewCae()>
  <#assign previewCss=bp.setting(self, "previewCss", []) />
  <#list previewCss as css>
    <@cm.include self=css view="asCSSLink"/>
  </#list>
</#if>

<#-- include javascript -->
<#list self.headJavaScript![] as js>
  <@cm.include self=js view="asJSLink"/>
</#list>

<#-- include javascript with conditional comments for IE -->
<#list self.internetExplorerJavaScript![] as js>
  <@cm.include self=js view="asJSLink"/>
</#list>

<#-- include PDE -->
<@preview.previewScripts/>

<#-- hook for extensions in head (for e.g. css or javascripts) -->
<@cm.hook id=bp.viewHookEventNames.VIEW_HOOK_HEAD />

<#-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 Include tag manager - This is the only difference to the same template defined in the page brick
-->
<#assign tagManagers=bp.setting(self, "TagManagement", [])/>
<#list tagManagers as tagManager>
  <#if !bp.isEmptyRichtext(tagManager.head!"")>
    <@cm.include self=tagManager.head view="script" />
  </#if>
</#list>
