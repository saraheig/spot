class PlacesCategory < ApplicationRecord
  belongs_to :place
  belongs_to :category
end
