<@cm.responseHeader name="Content-Type" value="text/html; charset=UTF-8"/>
<#-- @ftlvariable name="self" type="com.coremedia.blueprint.assets.cae.DownloadCollectionOverview" -->
<#-- @ftlvariable name="_csrf" type="org.springframework.security.web.csrf.CsrfToken" -->

<div class="am-download-collection-overview">

  <#if self.renditions?has_content>
    <div class="am-download-collection-overview__items">
      <#list self.renditions as rendition>
        <@cm.include self=rendition view="asCollectionItem" params={
          "classBox": "am-download-collection-overview__item"
        } />
      </#list>
    </div>
    <div class="am-download-collection-overview__controls">
      <#assign btnDataDownloadCollection={
        "prepareUrl" : cm.getLink(self, "_download-collection-prepare"),
        "downloadUrl" : cm.getLink(self, "_download-collection-download")
      } />
      <#if _csrf?has_content>
        <#assign btnDataDownloadCollection=btnDataDownloadCollection + {
            "csrf_name" : _csrf.parameterName,
            "csrf_value" : _csrf.token
          } />
      </#if>
      <div class="am-download-collection" <@cm.dataAttribute name="data-am-download-collection-trigger" data=btnDataDownloadCollection/>>
        <button type="button" class="am-download-collection__button am-download-collection__downloadButton am-button am-text-scalable">
          ${cm.getMessage("am_download_collection_download_button")}
        </button>
      </div>
    </div>
  <#else>
    <div class="am-download-collection-overview__notification am-notification am-notification--info">
      ${cm.getMessage("am_download_collection_overview_empty")}
    </div>
  </#if>
</div>
