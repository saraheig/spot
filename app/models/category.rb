class Category < ApplicationRecord
  has_and_belongs_to_many :place, join_table: :places_categories
  before_validation :strip_blanks

  validates_presence_of :title
  validates_length_of :title, maximum: 20
  validates_uniqueness_of :title, case_sensitive: false

  # Function to remove spaces in the string and text fields
  def strip_blanks
    self.title = title.strip
    self.description = description.strip
  end
end
