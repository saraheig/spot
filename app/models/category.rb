class Category < ApplicationRecord
  has_and_belongs_to_many :places

  validates_presence_of :title
  validates_length_of :title, maximum: 20
  validates_uniqueness_of :title, case_sensitive: false

  # Functions to remove spaces in the string and text fields
  def title=(title)
    self[:title] = title.strip
  end

  def description=(description)
    self[:description] = description.strip
  end
end