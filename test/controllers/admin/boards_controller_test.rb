require 'test_helper'

class Admin::BoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_boards_index_url
    assert_response :success
  end

end
