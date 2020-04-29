require 'application_system_test_case'

class LanguagesTest < ApplicationSystemTestCase
  setup do
    @language = languages(:languageOne)
  end

  test 'modifying the language' do
    visit places_url
    click_on I18n.t('buttons.language')
    assert_selector 'div.title.is-4', text: I18n.t('language.choice')
    page.select @language.name, from: 'code'
    click_on I18n.t('buttons.validate')
  end
end
