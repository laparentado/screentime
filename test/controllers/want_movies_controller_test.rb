require 'test_helper'

class WantMoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get want_movies_index_url
    assert_response :success
  end

  test "should get show" do
    get want_movies_show_url
    assert_response :success
  end

  test "should get edit" do
    get want_movies_edit_url
    assert_response :success
  end

end
