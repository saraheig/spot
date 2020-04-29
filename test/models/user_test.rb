require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:userOne)
  end

  test 'validates password, pseudo and email presence' do
    user = User.new(password: nil, pseudo: nil, email: nil)
    assert_not user.valid?
    assert_equal %i[password pseudo email], user.errors.keys
  end

  test 'ensures that pseudo length is less than 20' do
    user = User.new(password: 'secret', pseudo: 'Lorem ipsum dolor eum', email: @user.email)
    assert_not user.valid?
    assert_equal %i[pseudo], user.errors.keys
  end

  test 'ensures that pseudo is unique' do
    user = User.new(password: 'secret', pseudo: @user.pseudo, email: @user.email)
    assert_not user.valid?
    assert_equal %i[pseudo], user.errors.keys
  end

  test 'ensures that password length is more than 5' do
    user = User.new(password: 'Cras', pseudo: 'newPseudo', email: @user.email)
    assert_not user.valid?
    assert_equal %i[password], user.errors.keys
  end

  test 'ensures that email length is less than 50' do
    user = User.new(password: 'secret', pseudo: 'newPseudo', email: 'Lorem ipsum dolor sit amet, consecteturs tinciduntr')
    assert_not user.valid?
    assert_equal %i[email], user.errors.keys
  end
end
