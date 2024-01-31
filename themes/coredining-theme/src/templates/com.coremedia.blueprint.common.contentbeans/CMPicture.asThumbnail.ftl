<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.contentbeans.CMPicture" -->
<div<@preview.metadata self.content />>
  <@cm.include self=self view="media"
               params={
                 "classBox" : "xx-picture xx-picture--thumbnail",
                 "classMedia" : "xx-picture__image"
               } />
</div>
