class Place < ApplicationRecord
  include TranslatedAttributes

  translated_attributes :title, :description, :schedule

  has_one_attached :image
  has_and_belongs_to_many :categories
  belongs_to :user, optional: true
  belongs_to :admin_user, optional: true

  validates_presence_of :title
  validates_length_of :title, maximum: 40
  validates_uniqueness_of :titles, case_sensitive: false
  validates_numericality_of :price_chf, greater_than_or_equal_to: 0, allow_nil: true
  validates_numericality_of :duration_minutes, only_integer: true, greater_than: 0, less_than_or_equal_to: 500, allow_nil: true
  validates_length_of :url, maximum: 250
  validates_presence_of :geometry

  scope :by_category, lambda { |category|
    joins(:categories).where(categories: { id: category })
  }
end
