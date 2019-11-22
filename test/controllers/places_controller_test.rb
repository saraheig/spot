require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place = places(:placeOne)
  end

  test 'should get index' do
    get places_url
    assert_response :success
  end

  test 'should get new' do
    get new_place_url
    assert_response :success
  end

  test 'should create place' do
    assert_difference('Place.count') do
      img = fixture_file_upload('files/rails.jpg', 'application/jpg')
      post places_url, params: { place: {
        title: 'NewPlace', image: img, description: @place.description, price_chf: @place.price_chf, duration_minutes: @place.duration_minutes, schedule: @place.schedule, lat: @place.lat, lng: @place.lng
      } }
    end

    assert_redirected_to place_url(Place.last)
  end

  test 'should show place' do
    get place_url(@place)
    assert_response :success
  end
end
