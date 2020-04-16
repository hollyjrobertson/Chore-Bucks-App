# Pulls Test_helper method (useful for the "minitest/reporters" - test bar)
require 'test_helper'

class TheControllerTest < ActionDispatch::IntegrationTest
  puts "************************************"
  puts "********Testing Begin***************"
  # Defines @base_title to be used in many tests
  def setup
    @user = User.new(id: 1, name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
    @testChore = @user.chores.build(title: "Sweep", description: "Sweep the floors", price: 10,
                                    difficultyLvl: 2, completeBy: 3/28/2024, isFunded: 0, isAvailable: 0, isCheckedOut: 0,
                                    isCompleted: 0, isApproved: 0, isPaid: 0)
  end

  # Test that verifies the root_path returns a 200 success code
  test "root path" do
    get root_path
    assert_response :success
    puts name + " passed"
  end

  # Test that verifies the get call to signup_path returns a 200 success code
  test "get signup path" do
    get signup_path
    assert_response :success
    puts name + " passed"
  end

  # Test that verifies the get call to users_path  returns a 200 success code
  test "get users path" do
    get users_path
    assert_response :found
    puts name + " passed"
  end

  # Test that verifies the get call to login_path returns a 200 success code
  test "get login path" do
    get login_path
    assert_response :success
    puts name + " passed"
  end

  # Test that verifies if a user can signup
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
      follow_redirect!
    end
    puts name + " passed"
  end

  # Test that verifies if a user can signup
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    puts name + " passed"
  end

  # Test that verifies a user can be saved to db
  test "setup user can save to db" do
    assert @user.valid?
    puts name + " passed"
  end

  # Test that a user has a name before saving to db
  test "user has a name" do
    @user.name = "     "
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that a user has an email before saving to db
  test "user has an email" do
    @user.email = "     "
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that a user's name isn't longer than 50 characters before saving to db
  test "name is less than 50 characters" do
    @user.name = "a" * 51
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that a user's email isn't longer than 255 characters before saving to db
  test "email is less than 255 characters" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that a user's email is formatted correctly before saving to db
  test "email validation" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
    puts name + " passed"
  end

  # Test that an incorrect formatted email address isn't saving to db
  test "reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
    puts name + " passed"
  end

  # Test that verifies the email address is unique to db before saving to db
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
    puts name + " passed"
  end

  # Test that verifies a password is present before saving to db
  test "user has a password" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that verifies a password is at least 6 characters before saving to db
  test "password is more than 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that verifies if a user can login
  test "verify a user can login" do
    get login_path
    log_in
    assert_equal(is_logged_in?, true)
    puts name + " passed"
  end

  # Test that verifies if a user can logout
  test "verify a user can login then logout" do
    get login_path
    log_in
    assert_equal(is_logged_in?, true, "True")
    log_out
    assert_equal(is_logged_in?, false, "False")
    puts name + " passed"
  end

  # Test the order of the Chores Table
  test "order of chores" do
    assert_equal(1, Chore.first.difficultyLvl)
    puts name + " passed"
  end

  # Test the length of the Chores Table
  test "length of chores" do
    assert_equal(6, Chore.count)
    puts name + " passed"
  end

  # Test that chores are deleted when a user is deleted
  test "delete chores when user is deleted" do
    @user.save
    @user.destroy
    assert_equal(0, Chore.count)
    puts name + " passed"
  end
end
