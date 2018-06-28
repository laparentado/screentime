require 'test_helper'

class WatchedsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get watcheds_new_url
    assert_response :success
  end

  test "should get index" do
    get watcheds_index_url
    assert_response :success
  end

  test "should get show" do
    get watcheds_show_url
    assert_response :success
  end

  test "should get edit" do
    get watcheds_edit_url
    assert_response :success
  end

end
