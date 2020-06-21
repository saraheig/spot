require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'validates title presence' do
    category = Category.new(title: nil)
    assert_not category.valid?
    assert_equal %i[title], category. errors.keys
  end

  test 'ensures that title length is less or egal to 20' do
    category = Category.new(title: 'Lorem ipsum dolor ex.')
    assert_not category.valid?
    assert_equal %i[title], category.errors.keys
  end
end
