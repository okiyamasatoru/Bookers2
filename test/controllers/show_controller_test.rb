require "test_helper"

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get show_edit_url
    assert_response :success
  end
end
