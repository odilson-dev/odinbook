require "test_helper"

class PrivateChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get private_chats_index_url
    assert_response :success
  end

  test "should get show" do
    get private_chats_show_url
    assert_response :success
  end
end
