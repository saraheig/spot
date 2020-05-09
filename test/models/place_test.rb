require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test 'validates title and geometry presence' do
    place = Place.new(title: nil, geometry: nil)
    assert_not place.valid?
    assert_equal %i[title geometry], place.errors.keys
  end
end
