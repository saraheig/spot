require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:userOne)
    # Set a thin width to the browser page
    page.driver.browser.manage.window.resize_to(400, 1000)
  end

  test 'creating a user' do
    visit places_url

    find(:css, 'a.navbar-burger').click
    click_on I18n.t('menu.login')
    assert_selector 'div.title.is-4', text: I18n.t('user.login')
    click_on I18n.t('buttons.register')

    fill_in 'user[pseudo]', with: 'NewPseudo'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: 'secret'
    fill_in 'user[password_confirmation]', with: 'secret'

    click_on I18n.t('buttons.save')
    assert_text I18n.t('messages.register')
  end

  test 'logging, updating and deleting a user' do
    visit places_url

    find(:css, 'a.navbar-burger').click
    click_on I18n.t('menu.login')
    assert_selector 'div.title.is-4', text: I18n.t('user.login')

    fill_in 'pseudo', with: @user.pseudo
    fill_in 'password', with: 'secret'
    click_on I18n.t('buttons.login')
    assert_text I18n.t('messages.login_confirmation')
    assert_selector 'div.title.is-4', text: I18n.t('general.title')

    find(:css, 'a.navbar-burger').click
    click_on I18n.t('menu.profile')
    assert_selector 'div.title.is-4', text: I18n.t('user.profile')

    click_on I18n.t('buttons.modify_user')
    assert_selector 'div.title.is-4', text: I18n.t('user.edit')
    fill_in 'user[password]', with: 'NewSecret'
    fill_in 'user[password_confirmation]', with: 'NewSecret'
    click_on I18n.t('buttons.save')
    assert_text I18n.t('messages.edit')
    assert_selector 'div.title.is-4', text: I18n.t('user.profile')

    click_on I18n.t('buttons.delete_user')
    page.driver.browser.switch_to.alert.accept
    assert_text I18n.t('messages.delete_user')
    assert_selector 'div.title.is-4', text: I18n.t('general.title')
  end
end
