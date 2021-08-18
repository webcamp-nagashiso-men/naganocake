require 'test_helper'

class Public::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_end_users_show_url
    assert_response :success
  end

  test "should get puit" do
    get public_end_users_puit_url
    assert_response :success
  end

  test "should get out" do
    get public_end_users_out_url
    assert_response :success
  end

  test "should get edit" do
    get public_end_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_end_users_update_url
    assert_response :success
  end

end
