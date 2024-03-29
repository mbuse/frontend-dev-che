<#-- @ftlvariable name="self" type="com.coremedia.livecontext.context.LiveContextNavigation" -->
<#-- @ftlvariable name="isRoot" type="java.lang.Boolean" -->
<#-- @ftlvariable name="cssClass" type="java.lang.String" -->
<#-- @ftlvariable name="isTopLevel" type="java.lang.Boolean" -->
<#-- @ftlvariable name="maxDepth" type="java.lang.Integer" -->
<#-- @ftlvariable name="showNavigationLabel" type="java.lang.Boolean" -->

<#assign cssClass=cm.localParameters().cssClass!""/>
<#assign isRoot=(isRoot!true)/>
<#assign isTopLevel=cm.localParameters().isTopLevel!false/>
<#assign showNavigationLabel=cm.localParameters().showNavigationLabel!false/>
<#assign contentData=self.content!{}/>
<#assign depth=cm.localParameters().depth+1!1/>
<#assign maxDepth=cm.localParameters().maxDepth!0/>
<#assign showPicturesInNavigation=cm.localParameters().showPicturesInNavigation!true/>

<#if isRoot || (!((self.hidden)!false))>

<#-- add css class active, if this item is part of the active navigation -->
  <#if (bp.isActiveNavigation(self, (cmpage.navigation.navigationPathList)![]))>
    <#assign cssClass= cssClass + " cm-navigation-item--active"/>
  </#if>

  <#if self.visibleChildren?has_content>
  <li class="${cssClass} cm-navigation-item cm-navigation-item--depth-${depth}<#if isTopLevel></#if>" <@preview.metadata data=["properties.children", contentData]/>>
  <#--link to this item in navigation and render children in dropdown list -->
    <@cm.include self=self view="asLink" params={"cssClass" : "cm-navigation-item__title"}/>
    <#if isTopLevel && (maxDepth > 0)>
      <#assign cssClass=cssClass />
      <button type="button" class="cm-navigation-item__toggle" aria-haspopup="true" disabled></button>
    </#if>
    <@cm.include self=self view="asLinkList" params={
      "isRoot": false,
      "depth": depth,
      "maxDepth": maxDepth,
      "cssClass": cssClass,
      "showPicturesInNavigation": showPicturesInNavigation,
      "showNavigationLabel": showNavigationLabel
    }/>
  </li>
  <#else>
    <li class="${cssClass} cm-navigation-item cm-navigation-item--depth-${depth}" <@preview.metadata data=["properties.children", contentData]/>>
    <#-- link to this item in navigation -->
      <@cm.include self=self view="asLink" params={"cssClass" : "cm-navigation-item__title"}/>
      <#if showPicturesInNavigation && depth == 2>
        <#if self.category.picture?has_content>
          <#assign picture=lc.createBeanFor(self.category.picture)/>
        <#elseif self.category.catalogPicture?has_content>
          <#assign picture=self.category.catalogPicture/>
        <#elseif self.picture?has_content>
          <#assign picture=self.picture/>
        </#if>

        <#if picture?has_content>
          <a class="cm-navigation-item__picture-link" href="${cm.getLink(self!cm.UNDEFINED)}">
            <@cm.include self=picture!cm.UNDEFINED view="media" params={
              "classBox": "cm-navigation-item__picture-box",
              "classMedia": "cm-navigation-item__picture",
              "metadata": ["properties.picture"]
            }/>
          </a>
        </#if>
      </#if>
    </li>
  </#if>
</#if>
