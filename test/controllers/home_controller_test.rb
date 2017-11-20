require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Waka"
  end

  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get about" do
    get home_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get home_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end
