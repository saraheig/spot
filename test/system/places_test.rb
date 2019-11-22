require 'application_system_test_case'

class PlacesTest < ApplicationSystemTestCase
  setup do
    @place = places(:placeOne)
    @category = categories(:categoryOne)
  end

  test 'visiting the index' do
    visit places_url
    assert_selector 'div.title.is-4', text: I18n.t('general.title')
  end

  test 'creating a place' do
    visit places_url
    # Set a thin width to the browser page
    page.driver.browser.manage.window.resize_to(400, 1000)
    # Open the place form with the navbar-burger (thin screen) (responsive)
    find(:css, 'a.navbar-burger').click
    click_on I18n.t('menu.spot')
    # Go back to the previous page
    click_on I18n.t('buttons.cancel')
    # Modify browser page size (large width)
    page.driver.browser.manage.window.resize_to(1400, 1000)
    # Open the place form directly with the button on the large screen
    click_on I18n.t('menu.spot')

    fill_in 'place[title]', with: 'VeryNewPlace'
    find(:css, "#place_category_ids_[value='#{@category.id}']").set(true)
    fill_in 'place[price_chf]', with: @place.price_chf
    fill_in 'place[duration_minutes]', with: @place.duration_minutes
    fill_in 'place[schedule]', with: @place.schedule
    fill_in 'place[description]', with: @place.description
    fill_in 'place[lat]', with: 46.66
    fill_in 'place[lng]', with: 9.55

    click_on I18n.t('buttons.create')
    assert_text I18n.t('messages.create')
  end

  test 'filtering the places' do
    visit places_url
    page.driver.browser.manage.window.resize_to(400, 1000)
    find(:css, 'a.navbar-burger').click
    # Filter with a specific category
    click_on @category.title
    assert_selector 'div.subtitle.is-6', text: @category.title.downcase
    # Check the number of cards (-> places) for the category
    assert_selector 'div.card', count: 2
  end
end
