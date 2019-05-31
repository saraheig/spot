class CategoriesPlace < ApplicationRecord
  belongs_to :category
  belongs_to :place
end
