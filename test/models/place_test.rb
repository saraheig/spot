require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  setup do
    @place = places(:placeOne)
  end

  test 'validates title and geometry presence' do
    place = Place.new(title: nil, geometry: nil)
    assert_not place.valid?
    assert_equal %i[title geometry], place.errors.keys
  end

  test 'ensures that title length is less or egal to 40' do
    place = Place.new(title: 'Lorem ipsum dolor sit amet viverra fusce.', geometry: @place.geometry)
    assert_not place.valid?
    assert_equal %i[title], place.errors.keys
  end

  test 'ensures that url length is less or egal to 250' do
    place = Place.new(title: 'newTitle', geometry: @place.geometry, url: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eros dolor, pulvinar non consequat at, posuere nec magna. Morbi nisi neque, vestibulum sed iaculis vitae, aliquet nec augue. Interdum et malesuada fames ac ante ipsum primis in faucibus leo.')
    assert_not place.valid?
    assert_equal %i[url], place.errors.keys
  end

  test 'ensures that titles set is unique' do
    place = Place.new(titles: @place.titles, geometry: @place.geometry)
    assert_not place.valid?
    assert_equal %i[titles], place.errors.keys
  end

  test 'ensures that price is greater or egal to 0' do
    place = Place.new(title: 'newTitle', geometry: @place.geometry, price_chf: -1)
    assert_not place.valid?
    assert_equal %i[price_chf], place.errors.keys
  end

  test 'ensures that duration is greater than 0' do
    place = Place.new(title: 'newTitle', geometry: @place.geometry, duration_minutes: -1)
    assert_not place.valid?
    assert_equal %i[duration_minutes], place.errors.keys
  end
end
