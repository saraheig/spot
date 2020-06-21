require 'test_helper'

class Admin::AdminUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = admin_users(:adminUserOne)
  end

  test 'should get index admin users' do
    get admin_admin_users_url
    assert_response :success
  end

  test 'should get new admin user' do
    get new_admin_admin_user_url
    assert_response :success
  end

  test 'should show admin user' do
    get admin_admin_user_url(@admin_user)
    assert_response :success
  end
end
