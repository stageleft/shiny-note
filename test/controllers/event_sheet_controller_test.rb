require 'test_helper'

class EventSheetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_sheet_index_url
    assert_response :success
  end

end
