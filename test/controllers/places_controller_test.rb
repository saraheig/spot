require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place = places(:placeOne)
    @user = users(:userOne)
  end

  test 'should get index places with the cards' do
    get places_url
    assert_response :success
  end

  test 'should get index places with the map' do
    get places_map_url
    assert_response :success
  end

  test 'should get index places with the places of user after registering' do
    create_user
    get places_by_user_url(@last_user)
    assert_template :index
    assert_select 'div.card', count: 0
  end

  test 'should get new place after registering' do
    create_user
    get new_place_url
    assert_response :success
  end

  test 'should not get new place if not registered' do
    get new_place_url
    assert_redirected_to new_session_url
  end

  test 'should create place after registering' do
    create_user
    assert_difference('Place.count') do
      img = fixture_file_upload('files/rails.jpg', 'application/jpg')
      post places_url, params: { place: {
        title: 'NewPlace', image: img, description: @place.descriptions['en'],
        price_chf: @place.price_chf, duration_minutes: @place.duration_minutes,
        schedule: @place.schedules['en'], geometry: @place.geometry,
        user_id: @last_user.id, url: @place.url
      } }
    end

    assert_redirected_to place_url(Place.last)
  end

  test 'should not create place (title not specified) after registering' do
    create_user
    assert_difference('Place.count', 0) do
      post places_url, params: { place: {
        title: nil
      } }
    end
    assert_template :new
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
