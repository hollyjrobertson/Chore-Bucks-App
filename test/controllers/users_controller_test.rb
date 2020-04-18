# Pulls Test_helper method (useful for the "minitest/reporters" - test bar)


class TheControllerTest < ActionDispatch::IntegrationTest
  puts "************************************"
  puts "********Testing Begin***************"
  # Defines @base_title to be used in many tests
  def setup
    # @base_title = "Chore Bucks"
    #@user = User.new(name: "Example User", email: "user@example.com",
    #                  password: "foobar", password_confirmation: "foobar")
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
    assert_response :success
    puts name + " passed"
  end

  # Test that verifies the get call to login_path returns a 200 success code
  test "get login path" do
    get login_path
    assert_response :success
    puts name + " passed"
  end

end
