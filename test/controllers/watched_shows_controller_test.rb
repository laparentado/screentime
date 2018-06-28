require 'test_helper'

class WatchedShowsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get watched_shows_show_url
    assert_response :success
  end

  test "should get edit" do
    get watched_shows_edit_url
    assert_response :success
  end

end
