require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium_chrome, options: { args: ['lang=de', 'disable-gpu', 'no-sandbox', 'disable-dev-shm-usage'] }
end
