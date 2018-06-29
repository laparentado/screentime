require 'test_helper'

class WantShowControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get want_show_index_url
    assert_response :success
  end

  test "should get show" do
    get want_show_show_url
    assert_response :success
  end

  test "should get edit" do
    get want_show_edit_url
    assert_response :success
  end

end
