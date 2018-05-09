require 'test_helper'

class SidolControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sidol_index_url
    assert_response :success
  end

end
