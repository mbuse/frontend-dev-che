<#-- @ftlvariable name="self" type="com.coremedia.blueprint.elastic.social.cae.controller.ReviewsResult" -->
<#-- @ftlvariable name="elasticSocialConfiguration" type="com.coremedia.blueprint.base.elastic.social.configuration.ElasticSocialConfiguration" -->
<#-- @ftlvariable name="_csrf" type="org.springframework.security.web.csrf.CsrfToken" -->

<#import "*/node_modules/@coremedia/brick-utils/src/freemarkerLibs/components.ftl" as components />
<#import "../../freemarkerLibs/elastic-social.ftl" as elasticSocial />

<div class="cm-reviews__new-review cm-new-review">
  <form method="post" enctype="multipart/form-data" class="cm-new-review__form cm-form" action="${cm.getLink(self)}" data-cm-es-ajax-form=''>

    <@elasticSocial.notification type="inactive" additionalClasses=["cm-form__notification"] attr={"data-cm-notification": '{"path": ""}'} />

    <#if _csrf?has_content><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"></#if>
    <input type="hidden" name="replyTo" value="">
    <fieldset class="cm-form__fieldset cm-fieldset">

      <div class="cm-fieldset__item cm-field">
        <@elasticSocial.notification type="inactive" additionalClasses=["cm-field__notification"] attr={"data-cm-notification": '{"path": "rating"}'} />
        <div class="cm-field__value cm-rating">
          <legend>Rating</legend>
          <#-- render all ratings in reversed order -->
          <#list es.getReviewMaxRating()..1 as currentRating>
            <#assign radioAttr="" />
            <#assign radioId=bp.generateId("cm-review-rating-indicator-") />
            <input name="rating" value="${currentRating}" id="${radioId}" type="radio"${radioAttr}><label for="${radioId}" class="cm-rating__option cm-rating-indicator"></label>
          </#list>
        </div>
      </div>

      <div class="cm-fieldset__item cm-field">
        <#assign idTitle=bp.generateId("cm-new-review__title-") />
        <@elasticSocial.notification type="inactive" additionalClasses=["cm-field__notification"] attr={"data-cm-notification": '{"path": "title"}'} />
        <label for="${idTitle}" class="cm-field__name"><@cm.message "reviewForm_label_title" /></label>
        <input type="text" class="cm-field__value cm-textfield" name="title" id="${idTitle}" placeholder="${cm.getMessage("reviewForm_placeholder_title")}">
      </div>
      <div class="cm-fieldset__item cm-field">
        <#assign idText=bp.generateId("cm-new-review__textarea-") />
        <@elasticSocial.notification type="inactive" additionalClasses=["cm-field__notification"] attr={"data-cm-notification": '{"path": "text"}'} />
        <label for="${idText}" class="cm-field__name"><@cm.message "reviewForm_label_text" /></label>
        <textarea name="text" class="cm-field__value cm-textarea" id="${idText}" placeholder="${cm.getMessage("reviewForm_placeholder_text")}"></textarea>
      </div>

      <#if es.isAnonymousUser() && self.elasticSocialConfiguration.recaptchaForReviewRequired!false>
        <@elasticSocial.notification type="inactive" additionalClasses=["cm-field__notification"] attr={"data-cm-notification": '{"path": "recaptcha"}'} />
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <div class="g-recaptcha" data-sitekey="${self.elasticSocialConfiguration.recaptchaPublicKey!""}"></div>
      </#if>

      <div class="cm-fieldset__item cm-button-group cm-button-group--default">
        <@components.button text=cm.getMessage("reviewForm_label_hide") attr={"type": "button", "classes": ["btn", "cm-button-group__button", "cm-button--secondary"], "data-cm-button--cancel": ""} />
        <@components.button text=cm.getMessage("reviewForm_label_submit") attr={"type": "submit", "classes": ["btn", "cm-button-group__button"], "data-cm-button--submit": ""} />
      </div>
    </fieldset>
  </form>
</div>
