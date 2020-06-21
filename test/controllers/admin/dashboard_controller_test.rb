require 'test_helper'

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test 'should get dashboard informations' do
    get admin_root_url
    assert_response :success

    # Check the number of panels (2)
    assert_select 'div.panel_contents', count: 2
    # Check the number of elements in lists (all category + the three last places)
    assert_select 'div.panel_contents>ul>li', count: Category.count + 3
    # Check that the last place is visible
    assert_select 'div.panel_contents>ul>li', text: Place.last.title
  end
end
