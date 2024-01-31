<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.contentbeans.CMTeasable" -->
<#import "*/node_modules/@coremedia/brick-utils/src/freemarkerLibs/utils.ftl" as utils />

<#assign targetLink=cm.getLink(self.target!cm.UNDEFINED) />
<div class="box col-xl-12 clearfix"<@preview.metadata self.content />>

  <div class="col-sm-3"<@preview.metadata "properties.pictures" />>
    <@utils.optionalLink href=targetLink>
      <@cm.include self=self.picture!cm.UNDEFINED view="asThumbnail" />
    </@utils.optionalLink>
  </div>
  <div class="col-sm-9">
    <hr>
    <h3 class="intro-text text-center"<@preview.metadata "properties.teaserTitle" />>
      <@utils.optionalLink href=targetLink>
        <strong>${self.teaserTitle!self.title!'No title'}</strong>
      </@utils.optionalLink>
    </h3>
    <hr>
    <#assign truncatedTeaserText=bp.truncateText(self.teaserText!"", bp.setting(cmpage, "teaser.max.length", 140)) />
    <div<@preview.metadata "properties.teaserText" />>
    <@utils.renderWithLineBreaks text=truncatedTeaserText />
    </div>
  </div>
</div>
