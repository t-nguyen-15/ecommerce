require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ecommerce"
  end

  test "should get root" do 
    get root_url
    assert_response :success
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get signin" do
    get static_pages_signin_url
    assert_response :success
    assert_select "title", "Sign In | #{@base_title}"
  end
end
