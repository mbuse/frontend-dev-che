<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.contentbeans.CMArticle" -->
<div class="box col-xl-12"<@preview.metadata self.content />>
  <hr>
  <h2 class="intro-text text-center"<@preview.metadata "properties.title" />>
    <strong>${self.title!"No Title"}</strong>
  </h2>
  <hr>

  <p class="text-center">
    <@cm.include self=cmpage.navigation view="asBreadcrumb" />
  </p>

  <div<@preview.metadata "properties.pictures" />>
    <@cm.include self=self view="_pictures" />
  </div>

  <hr>

  <div<@preview.metadata "properties.detailText" />>
    <@cm.include self=self.detailText!cm.UNDEFINED />
  </div>

  <div<@preview.metadata "properties.related" />>
    <@cm.include self=self view="_related" />
  </div>
</div>
