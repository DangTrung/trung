require 'test_helper'

class CatchErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get file_not_found" do
    get catch_errors_file_not_found_url
    assert_response :success
  end

  test "should get unprocessable" do
    get catch_errors_unprocessable_url
    assert_response :success
  end

  test "should get internal_server_error" do
    get catch_errors_internal_server_error_url
    assert_response :success
  end

end
