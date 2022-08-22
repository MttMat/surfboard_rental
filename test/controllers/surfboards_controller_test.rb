require "test_helper"

class SurfboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get surfboards_index_url
    assert_response :success
  end
end
