<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.contentbeans.CMTeasable" -->
<#-- @ftlvariable name="highlightingItem" type="java.util.Map" -->

<#import "../../freemarkerLibs/search.ftl" as search />
<#import "*/node_modules/@coremedia/brick-utils/src/freemarkerLibs/utils.ftl" as utils />

<#--
    Template Description:

    Displays a single search result item with a picture, title and some text, like htmlDescription or teaserText.
    It also includes the viewHook VIEW_HOOK_SEARCH for additional dynamic informations like ratings.
-->

<#assign highlightingItem=cm.localParameters().highlightingItem!{} />
<#assign teaserLength=bp.setting(self, "teaser.max.length", 200)/>
<#assign teaserTitle=(highlightingItem["teaserTitle"][0])!self.teaserTitle!"" />
<#assign target=(self.target?has_content && self.target.openInNewTab)?then('target="_blank"', "") />
<#assign rel=(self.target?has_content && self.target.openInNewTab)?then('rel="noopener"', "") />

<div class="cm-search-result__item"<@preview.metadata self.content />>
  <#-- image -->
  <#if self.picture?has_content>
    <a class="cm-search-result__image" href="${cm.getLink(self.target!cm.UNDEFINED)}" ${target?no_esc} ${rel?no_esc}>
    <@cm.include self=self.picture view="media" params={
      "classBox": "cm-search-result__picture-box",
      "classMedia": "cm-search-result__picture",
      "metadata": ["properties.pictures"]
    }/>
    </a>
  </#if>

  <div class="cm-search-result__caption">
    <#-- teaserTitle -->
    <h3 class="cm-search-result__title"<@preview.metadata "properties.teaserTitle" />>
      <a href="${cm.getLink(self.target!cm.UNDEFINED)}" ${target?no_esc} ${rel?no_esc}>
        ${teaserTitle?no_esc}
      </a>
    </h3>

    <#-- teaserText or htmlDescription as fallback -->
    <#if !bp.isEmptyRichtext(self.teaserText!"")>
      <p<@preview.metadata "properties.teaserText" />>
        <@search.renderDate date=self.externallyDisplayedDate />
        <span<@preview.metadata "properties.teaserText" />>${bp.truncateHighlightedText((highlightingItem["teaserText"][0])!self.teaserText!"", teaserLength)?no_esc}</span>
      </p>
    <#elseif htmlDescription?has_content>
      <p class="cm-search-result__text">
        <@search.renderDate date=self.externallyDisplayedDate />
        <span<@preview.metadata "properties.htmlDescription" />>${bp.truncateHighlightedText((highlightingItem["htmlDescription"][0])!self.htmlDescription!"", teaserLength)?no_esc}</span>
      </p>
    <#else>
      <p class="cm-search-result__text">
        <@search.renderDate date=self.externallyDisplayedDate />
      </p>
    </#if>

    <#-- add hook for search result items -->
    <@cm.hook id=bp.viewHookEventNames.VIEW_HOOK_SEARCH />
  </div>

</div>
