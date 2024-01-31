<#-- @ftlvariable name="self" type="com.coremedia.blueprint.common.layout.Container" -->
<#assign paramsFromSelf = bp.setting(self, "carousel", {}) />
<#assign paramsFromContext = bp.setting(cmpage.navigation, "carousel", {}) />
<#assign defaultParams = { "itemsView" : "asTeaser",
                           "slickConfig" : {}
                         } />

<#assign carouselParams = defaultParams + paramsFromContext + paramsFromSelf />

<@cm.include self=self
             view="asCarousel"
             params=carouselParams />
