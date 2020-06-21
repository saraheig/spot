require 'test_helper'

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat_with_places = categories(:categoryOne)
    @cat_without_places = categories(:categoryThree)
  end

  test 'should not destroy category' do
    assert_difference('Category.count', 0) do
      delete admin_category_url(@cat_with_places.id)
    end

    assert_redirected_to admin_categories_url
  end

  test 'should destroy category' do
    assert_difference('Category.count', -1) do
      delete admin_category_url(@cat_without_places.id)
    end

    assert_redirected_to admin_categories_url
  end

  test 'should get index categories' do
    get admin_categories_url
    assert_response :success
  end

  test 'should get new category' do
    get new_admin_category_url
    assert_response :success
  end

  test 'should show category' do
    get admin_category_url(@cat_without_places.id)
    assert_response :success
  end
end
