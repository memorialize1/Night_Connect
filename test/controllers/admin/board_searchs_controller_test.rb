require 'test_helper'

class Admin::BoardSearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get admin_board_searchs_search_url
    assert_response :success
  end

end
