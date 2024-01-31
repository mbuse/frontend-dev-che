<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.contentbeans.CMPicture" -->
<div class="col-lg-12"<@preview.metadata self.content />>
  <@cm.include self=self view="media"
               params={
                 "classBox" : "xx-picture xx-picture--large",
                 "classMedia" : "xx-picture__image"
               } />
  <#if self.teaserText?has_content>
    <div class="text-center"<@preview.metadata "properties.detailText" />>
      <@cm.include self=self.detailText />
    </div>
  </#if>
</div>
