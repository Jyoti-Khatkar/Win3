require "test_helper"

class FriendRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friend_requests_index_url
    assert_response :success
  end
end
