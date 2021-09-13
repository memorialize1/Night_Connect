require 'test_helper'

class BoardSearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get board_searchs_search_url
    assert_response :success
  end

end
