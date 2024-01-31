<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.layout.PageGrid" -->
<#-- @ftlvariable name="cmpage" type="com.coremedia.blueprint.common.contentbeans.Page" -->

<div class="${self.cssClassName!''}">
  <#list self.rows![] as row>
    <#assign isSinglePlacementRow = row.placements?size==1 />
    <#assign firstPlacement = row.placements?first />
    <#if isSinglePlacementRow &&
         firstPlacement.additionalProperties['specialView']?has_content>
      <@cm.include self=firstPlacement
                   view=firstPlacement.additionalProperties['specialView'] />
    <#else>
      <div class="container">
        <div class="row">
          <#list row.placements![] as placement>
          <div class="col-lg-${placement.colspan}"<@preview.metadata data=[bp.getPlacementPropertyName(placement), bp.getPlacementHighlightingMetaData(placement)!""]/>>
            <#if placement.name=="main" && cmpage.detailView>
              <@cm.include self=cmpage.content />
            <#elseif placement.additionalProperties['specialView']?has_content>
              <@cm.include self=placement
                           view=placement.additionalProperties['specialView'] />
            <#else>
              <@cm.include self=placement view="asTeaser" />
            </#if>
          </div>
          </#list>
        </div>
      </div>
    </#if>
  </#list>
</div>
