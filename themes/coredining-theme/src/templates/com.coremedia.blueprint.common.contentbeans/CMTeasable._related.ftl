<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.contentbeans.CMTeasable" -->

<#if self.related?has_content>
  <hr />
  <div>
    <h3>Related</h3>
    <#if self.related?size lt 5>
      <@cm.include self=bp.getContainer(self.related)
                   view="_teaserRows"
                   params={
                     "columnCount" : self.related?size
                   } />
    <#else>
      <@cm.include self=bp.getContainer(self.related)
                   view="asCarousel"
                   params={
                     "itemsView": "asVerticalTeaser",
                     "slickConfig" : {
                       "autoplay" : true,
                       "autoplaySpeed" : 2000,
                       "slidesToShow" : 4
                     }
                   } />

    </#if>
  </div>
</#if>
