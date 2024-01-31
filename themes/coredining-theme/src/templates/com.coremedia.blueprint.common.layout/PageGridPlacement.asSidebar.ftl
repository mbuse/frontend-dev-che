<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.layout.Container" -->
<#-- @ftlvariable name="cmpage" type="com.coremedia.blueprint.common.contentbeans.Page" -->
<@cm.include self=self
             view="_teaserRows"
             params={
               "viewItems": "asVerticalTeaser"
             }/>