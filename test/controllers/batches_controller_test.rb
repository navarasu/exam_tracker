require "test_helper"

class BatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get batches_index_url
    assert_response :success
  end

  test "should get new" do
    get batches_new_url
    assert_response :success
  end

  test "should get create" do
    get batches_create_url
    assert_response :success
  end

  test "should get show" do
    get batches_show_url
    assert_response :success
  end

  test "should get edit" do
    get batches_edit_url
    assert_response :success
  end

  test "should get update" do
    get batches_update_url
    assert_response :success
  end

  test "should get destroy" do
    get batches_destroy_url
    assert_response :success
  end
end
