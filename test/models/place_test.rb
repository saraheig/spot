require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test 'validates title, latitude and longitude presence' do
    place = Place.new(title: nil, lat: nil, lng: nil)
    assert_not place.valid?
    assert_equal %i[title lat lng], place.errors.keys
  end
end
