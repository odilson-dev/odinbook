require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "get index" do
    sign_in users(:abdullah)

    get users_path

    assert_response :success
  end
end
