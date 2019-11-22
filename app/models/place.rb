class Place < ApplicationRecord
  has_one_attached :image
  has_and_belongs_to_many :categories

  validates_presence_of :title
  validates_length_of :title, maximum: 40
  validates_uniqueness_of :title, case_sensitive: false
  validates_numericality_of :price_chf, greater_than_or_equal_to: 0, allow_nil: true
  validates_numericality_of :duration_minutes, only_integer: true, greater_than: 0, less_than_or_equal_to: 500, allow_nil: true
  validates_presence_of :lat
  # Range of the latitudes values in Switzerland (:allow_nil => true to avoid double validation errors)
  validates_numericality_of :lat, greater_than_or_equal_to: 45.7, less_than_or_equal_to: 47.9, allow_nil: true
  validates_presence_of :lng
  # Range of the longitude values in Switzerland (:allow_nil => true to avoid double validation errors)
  validates_numericality_of :lng, greater_than_or_equal_to: 5.7, less_than_or_equal_to: 10.6, allow_nil: true

  scope :by_category, lambda { |category|
    joins(:categories).where(categories: { id: category })
  }

  # Functions to remove spaces in the string and text fields
  def title=(title)
    self[:title] = title.strip if title
  end

  def description=(description)
    self[:description] = description.strip if description
  end

  def schedule=(schedule)
    self[:schedule] = schedule.strip if schedule
  end
end
