require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new session' do
    get new_session_url
    assert_response :success
  end

  test 'should destroy session' do
    delete session_url
    assert_redirected_to places_url
  end
end
