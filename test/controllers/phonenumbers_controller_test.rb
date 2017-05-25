require 'test_helper'

class PhonenumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get phonenumbers_new_url
    assert_response :success
  end

  test "should get index" do
    get phonenumbers_index_url
    assert_response :success
  end

end
