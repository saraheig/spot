module FormsHelper
  def translated_input(form, attr, **options)
    form.semantic_fields_for attr do |f|
      Current.language.each do |lang|
        f.input lang.code.to_s, {
          label: attribute_label(form.object.class, attr, lang.code.to_s),
          input_html: { value: form.object.send(attr)[lang.code.to_s] }
        }.deep_merge(options)
      end
    end
  end

  private

  def attribute_label(model_class, attr, locale)
    txt = model_class.human_attribute_name(attr.to_s.singularize)
    if Current.language.many?
      txt += " (#{I18n.t("language.#{locale}").downcase})"
    end
    txt
  end
end
