class Place < ApplicationRecord
  before_validation :strip_blanks

  validates_presence_of :title
  validates_length_of :title, maximum: 40
  validates_uniqueness_of :title, case_sensitive: false
  validates_numericality_of :price, greater_than_or_equal_to: 0, allow_nil: true
  validates_format_of :price, with: /\A(\d+(\.[0-9][0|5]?)?)\Z/i, allow_blank: true
  validates_numericality_of :duration, only_integer: true, greater_than: 0, less_than_or_equal_to: 500, allow_nil: true
  validates_presence_of :lat
  # Range of the latitudes values in Switzerland (:allow_nil => true to avoid double validation errors)
  validates_numericality_of :lat, greater_than_or_equal_to: 45.7, less_than_or_equal_to: 47.9, allow_nil: true
  validates_presence_of :lng
  # Range of the longitude values in Switzerland (:allow_nil => true to avoid double validation errors)
  validates_numericality_of :lng, greater_than_or_equal_to: 5.7, less_than_or_equal_to: 10.6, allow_nil: true

  # Function to remove spaces in the string and text fields
  def strip_blanks
    self.title = title.strip
    self.description = description.strip
    self.schedule = schedule.strip
  end
end
