require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'validates title presence' do
    category = Category.new(title: nil)
    assert_not category.valid?
    assert_equal [:title], category. errors.keys
  end
end
