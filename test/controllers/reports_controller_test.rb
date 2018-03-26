require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get generate_reports" do
    get reports_generate_reports_url
    assert_response :success
  end

end
