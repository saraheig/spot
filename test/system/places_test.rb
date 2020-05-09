require 'application_system_test_case'

class PlacesTest < ApplicationSystemTestCase
  setup do
    @place = places(:placeOne)
    @category = categories(:categoryOne)
    @user = users(:userOne)
    # Set a thin width to the browser page
    page.driver.browser.manage.window.resize_to(400, 1000)
  end

  test 'visiting the index' do
    visit places_url
    assert_selector 'div.title.is-4', text: I18n.t('general.title')
    # Check the number of all cards (only places that are approved)
    assert_selector 'div.card', count: 2
  end

  test 'creating a place' do
    visit places_url
    # Open the place form with the navbar-burger (thin screen) (responsive)
    find(:css, 'a.navbar-burger').click
    click_on I18n.t('menu.login')
    fill_in 'pseudo', with: @user.pseudo
    fill_in 'password', with: 'secret'
    click_on I18n.t('buttons.login')
    find(:css, 'a.navbar-burger').click
    click_on I18n.t('menu.spot')
    # Go back to the previous page
    click_on I18n.t('buttons.cancel')
    # Modify browser page size (large width)
    page.driver.browser.manage.window.resize_to(1400, 1000)
    # Open the place form directly with the button on the large screen
    find(:css, 'a.navbar-link', text: I18n.t('menu.account')).click
    click_on I18n.t('menu.spot')

    fill_in 'place[title]', with: 'VeryNewPlace'
    find(:css, "#place_category_ids_[value='#{@category.id}']").set(true)
    fill_in 'place[price_chf]', with: @place.price_chf
    fill_in 'place[duration_minutes]', with: @place.duration_minutes
    fill_in 'place[schedule]', with: @place.schedule
    fill_in 'place[description]', with: @place.description
    fill_in 'place[lat]', with: @place.lat
    fill_in 'place[lng]', with: @place.lng

    click_on I18n.t('buttons.create')
    assert_text I18n.t('messages.create')
  end

  test 'filtering the places' do
    visit places_url
    find(:css, 'a.navbar-burger').click
    # Filter with a specific category
    click_on @category.title
    assert_selector 'div.subtitle.is-6', text: @category.title
    # Check the number of cards (-> places) for the category
    assert_selector 'div.card', count: 2
  end
end
