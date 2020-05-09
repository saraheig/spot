require 'application_system_test_case'

class Admin::PlacesTest < ApplicationSystemTestCase
  setup do
    # Set a thin width to the browser page
    page.driver.browser.manage.window.resize_to(400, 1000)
  end

  test 'accessing to administration and filtering places with scopes' do
    visit places_url
    # Open the administration interface with the navbar-burger (thin screen)
    find(:css, 'a.navbar-burger').click
    click_on I18n.t('menu.administration')
    click_on I18n.t('activerecord.models.place')

    assert_selector 'h2', text: I18n.t('activerecord.models.place')
    # Scope to quickly filter places -> display only unapproved places
    click_on I18n.t('active_admin.scopes.not_approved')
    # Check the number of cards related to unapproved places (1 place)
    assert_selector 'table>tbody>tr', count: 1
    # Scope to quickly filter places -> display all places
    click_on I18n.t('active_admin.scopes.all')
    # Check the number of cards related to all places (3 places)
    assert_selector 'table>tbody>tr', count: 3
  end
end
