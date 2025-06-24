require "test_helper"

class AnimesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get animes_new_url
    assert_response :success
  end

  test "should get create" do
    get animes_create_url
    assert_response :success
  end
end
