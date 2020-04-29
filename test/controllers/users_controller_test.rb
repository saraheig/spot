require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:userOne)
  end

  test 'should not get index users' do
    assert_raises(ActionController::RoutingError) do
      get users_url
    end
  end

  test 'should get new user' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, language: @user.language, password: 'secret', password_confirmation: 'secret', pseudo: 'newPseudo' } }
    end

    assert_redirected_to user_url(User.last)
  end

  test 'should show user after registering' do
    create_user
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit user after registering' do
    create_user
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user after registering' do
    create_user
    patch user_url(@user), params: { user: { email: @user.email, language: @user.language, password: 'secret', password_confirmation: 'secret', pseudo: @user.pseudo } }
    assert_redirected_to user_url(@user)
  end

  test 'should destroy user after registering' do
    create_user
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to places_url
  end

  private

  def create_user
    post users_url, params: { user: { email: @user.email, language: @user.language, password: 'secret', password_confirmation: 'secret', pseudo: 'newPseudo' } }
    @user = User.last
  end
end
