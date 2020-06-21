require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:userOne)
  end

  test 'should get index users' do
    get admin_users_url
    assert_response :success
  end

  test 'should get new user' do
    get new_admin_user_url
    assert_response :success
  end

  test 'should show user' do
    get admin_user_url(@user)
    assert_response :success
  end
end
