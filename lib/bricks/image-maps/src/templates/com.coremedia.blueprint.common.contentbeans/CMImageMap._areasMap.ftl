<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.contentbeans.CMImageMap" -->

<#import "*/node_modules/@coremedia/brick-utils/src/freemarkerLibs/utils.ftl" as utils />
<#import "*/node_modules/@coremedia/brick-utils/src/freemarkerLibs/components.ftl" as components />

<#-- if imageMapId is not given, generate new id -->
<#assign imageMapId=cm.localParameters().imageMapId!(bp.generateId("cm-map-")) />
<#assign imageMapAreas=bp.responsiveImageMapAreas(self) />

<#--imagemap with areas -->
<map <@utils.renderAttr attr={ "name": imageMapId, "classes": ["cm-imagemap__areas"] } /><@preview.metadata "properties.imageMapAreas" />>
  <#assign overlay=bp.setting(self, "overlay", {}) />
  <#-- show hotzones as areas with inline overlay or as icon -->
  <#list imageMapAreas![] as imageMapArea>
    <#if imageMapArea.linkedContent?has_content>
      <#assign linkedContent=imageMapArea.linkedContent />
      <#assign link=cm.getLink(linkedContent.target!cm.UNDEFINED) />

      <#-- hot zones as areas -->
      <@cm.include self=linkedContent!cm.UNDEFINED view="asImageMapArea" params={
        "imageMapArea": imageMapArea,
        "overlay": overlay
      } />

      <#-- inline overlay -->
      <#if imageMapArea.displayAsInlineOverlay!false>
        <#assign classOverlay="" />
        <#assign theme=imageMapArea.inlineOverlayTheme!"" />
        <#-- only allow valid themes -->
        <#if (["dark", "light", "dark-on-light", "light-on-dark"]?seq_contains(theme))>
          <#assign classOverlay="cm-overlay--theme-" + theme />
        </#if>
        <div class="cm-imagemap__hotzone cm-imagemap__hotzone--text">
          <@cm.include self=linkedContent!cm.UNDEFINED view="asImageMapInlineOverlay" params={
            "classOverlay": classOverlay,
            "overlay": overlay
          } />
        </div>

      <#-- icon -->
      <#else>
        <#assign parameters={"class": "cm-imagemap__hotzone cm-imagemap__hotzone--icon cm-imagemap__hotzone--loading", "metadata": linkedContent.content }/>
        <@components.button baseClass="" href="${link}" iconText=(linkedContent.teaserTitle!cm.getMessage("button_popup")) attr=parameters />
      </#if>
    </#if>

  <#-- add area for default target if no hotzones are available -->
  <#else>
    <@cm.include self=self view="asImageMapArea" params={
      "overlay": overlay
    } />
  </#list>
</map>
