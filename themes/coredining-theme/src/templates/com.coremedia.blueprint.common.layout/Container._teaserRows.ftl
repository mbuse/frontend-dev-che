<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.layout.Container" -->
<#-- @ftlvariable name="cmpage" type="com.coremedia.blueprint.common.contentbeans.Page" -->
<#-- @ftlvariable name="viewItem" type="java.lang.String" -->
<#-- @ftlvariable name="columnCount" type="java.lang.Integer" -->
<#-- @ftlvariable name="renderRows" type="java.lang.Boolean" -->

<#-- Parameters: -->
<#assign columnCount = cm.localParameter("columnCount", 1) />
<#assign viewItems   = cm.localParameter("viewItems", (columnCount==1)?then("asTeaser", "asVerticalTeaser")) />
<#assign renderRows  = cm.localParameter("renderRows", columnCount!=1)  />

<#assign columnClass = "col-lg-" + (12/columnCount)?round />
<div class="box"<@preview.metadata self.containerMetadata + self.itemsMetadata />>
<#list self.items![] as item>
  <#assign positionInRow=item?index % columnCount />
  <#if renderRows && positionInRow==0  >
  <div class="row row-eq-height">
  </#if>
  <div class="${columnClass}">
    <@cm.include self=item view="${viewItems}" />
  </div>
  <#if renderRows && ( positionInRow==columnCount-1 || item?is_last )>
  </div>
  </#if>
</#list>
</div>
