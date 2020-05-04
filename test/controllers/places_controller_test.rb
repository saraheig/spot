require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place = places(:placeOne)
    @user = users(:userOne)
  end

  test 'should get index places' do
    get places_url
    assert_response :success
  end

  test 'should get new place after registering' do
    create_user
    get new_place_url
    assert_response :success
  end

  test 'should create place after registering' do
    create_user
    assert_difference('Place.count') do
      img = fixture_file_upload('files/rails.jpg', 'application/jpg')
      post places_url, params: { place: {
        title: 'NewPlace', image: img, description: @place.descriptions['en'],
        price_chf: @place.price_chf, duration_minutes: @place.duration_minutes,
        schedule: @place.schedules['en'], lat: @place.lat, lng: @place.lng,
        user_id: @last_user.id
      } }
    end

    assert_redirected_to place_url(Place.last)
  end

  test 'should show place' do
    get place_url(@place)
    assert_response :success
  end

  private

  def create_user
    post users_url, params: { user: { email: @user.email, language: @user.language, password: 'secret', password_confirmation: 'secret', pseudo: 'newPseudo' } }
    @last_user = User.last
  end
end
