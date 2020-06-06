require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium_chrome, options: { args: ['lang=de', 'headless', 'disable-gpu', 'no-sandbox', 'disable-dev-shm-usage'] }
end
