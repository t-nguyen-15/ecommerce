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
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  # test "should get signin" do
  #   get static_pages_signin_url
  #   assert_response :success
  #   assert_select "title", "Sign In | #{@base_title}"
  # end

  # test "should get signup" do
  #   get static_pages_signup_url
  #   assert_response :success
  #   assert_select "title", "Sign up | #{@base_title}"
  # end
end
