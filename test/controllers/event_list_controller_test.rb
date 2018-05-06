require 'test_helper'

class EventListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_list_index_url
    assert_response :success
  end

end
