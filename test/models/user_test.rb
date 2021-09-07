require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "user attributes must not be empty" do
    user = User.new

    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:email].any?
  end

  def new_user(url)
    User.new name:"fred", avatar_url:url, email:"e@e.com"
  end

  test "avatar url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |image_url|
      assert new_user(image_url).valid?, "#{image_url} shouldn't be invalid"
    end

    bad.each do |image_url|
      assert new_user(image_url).invalid?, "#{image_url} should be valid"
    end
  end

  test "user is not valid without a unique name" do
    user = User.new(name: users(:jimu).name, email: "e@e.com", avatar_url: users(:jimu).avatar_url)
    assert user.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], user.errors[:name]
  end

  test "username should be at least 3 characters long" do
    user = users(:one)
    user.name = "ab"
    assert user.invalid?
    assert_equal ["is too short (minimum is 3 characters)"], user.errors[:name]
  end

end
