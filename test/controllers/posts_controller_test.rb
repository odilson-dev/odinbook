require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    sign_in users(:abdullah)

    get posts_url

    assert_response :success
  end

  test "should get new" do
    sign_in users(:abdullah)

    get new_post_url

    assert_response :success
  end

  test "should create post" do
    sign_in users(:abdullah)

    assert_difference("Post.count") do
      post posts_url, params: { post: { content: @post.content, user_id: @post.user_id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    sign_in users(:abdullah)

    get post_url(@post)

    assert_response :success
  end

  test "should get edit" do
    sign_in users(:abdullah)

    get edit_post_url(@post)

    assert_response :success
  end

  test "should update post" do
    sign_in users(:abdullah)

    patch post_url(@post), params: { post: { content: @post.content, user_id: @post.user_id } }

    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    sign_in users(:abdullah)

    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
