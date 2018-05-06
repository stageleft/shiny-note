require 'test_helper'

class PidolControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pidol_index_url
    assert_response :success
  end

end
