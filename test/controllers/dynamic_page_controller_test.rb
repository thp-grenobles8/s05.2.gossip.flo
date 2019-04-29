require 'test_helper'

class DynamicPageControllerTest < ActionDispatch::IntegrationTest
  test "should get gossip" do
    get dynamic_page_gossip_url
    assert_response :success
  end

end
