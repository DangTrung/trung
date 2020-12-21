require 'test_helper'

class HompageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hompage_index_url
    assert_response :success
  end

end
