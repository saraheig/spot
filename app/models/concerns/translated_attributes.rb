module TranslatedAttributes
  extend ActiveSupport::Concern

  class_methods do
    def translated_attributes(*attrs)
      attrs.each do |attr|
        column = attr.to_s.pluralize
        define_method(attr) { self[column][I18n.locale.to_s].presence }
        define_method("#{attr}=") { |str| self[column][I18n.locale.to_s] = str }

        scope "order_by_#{attr}", lambda {
          order(Arel.sql("#{table_name}.#{column}->>'#{I18n.locale}'"))
        }
        scope "#{attr}_not_eq", lambda { |str|
          where("#{table_name}.#{column}->>'#{I18n.locale}' != ?", str)
        }
      end

      define_singleton_method(:ransackable_scopes) do |auth_object = nil|
        super(auth_object) + attrs.map { |attr| "#{attr}_eq" }
      end
    end
  end
end
