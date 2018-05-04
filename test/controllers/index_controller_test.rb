require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
  #   assert true
    # url validation
    get "/"
    assert_response :success

    get "/index"
    assert_response :success

    get "/index/index"
    assert_response :success
    b = @response.body
    assert_match 'href="event-sheet"',  b, 'no event menu'
    assert_match 'href="produce-idol"', b, 'no produce idol menu'
    assert_match 'href="support-idol"', b, 'no support idol menu'

  end
end
