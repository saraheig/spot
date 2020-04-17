class Category < ApplicationRecord
  include TranslatedAttributes

  translated_attributes :title, :description

  has_and_belongs_to_many :places

  validates_length_of :title, maximum: 20
  validates_uniqueness_of :titles, case_sensitive: false
  validates_format_of :title, with: /\A[A-Za-z]+\Z/i, message: :wrong_format
end
