class Current < ActiveSupport::CurrentAttributes
  attribute :language

  def language
    unless super
      self.language = Language.order(:name)
    end
    super
  end
end
