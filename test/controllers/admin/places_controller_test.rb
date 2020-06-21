require 'test_helper'

class Admin::PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @placeApproved = places(:placeOne)
  end

  test 'should get index places' do
    get admin_places_url
    assert_response :success
  end

  test 'should show place' do
    get admin_place_url(@placeApproved)
    assert_response :success
  end
end
