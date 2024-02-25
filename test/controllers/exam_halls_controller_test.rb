require "test_helper"

class ExamHallsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exam_halls_index_url
    assert_response :success
  end

  test "should get new" do
    get exam_halls_new_url
    assert_response :success
  end

  test "should get create" do
    get exam_halls_create_url
    assert_response :success
  end

  test "should get show" do
    get exam_halls_show_url
    assert_response :success
  end

  test "should get edit" do
    get exam_halls_edit_url
    assert_response :success
  end

  test "should get update" do
    get exam_halls_update_url
    assert_response :success
  end

  test "should get destroy" do
    get exam_halls_destroy_url
    assert_response :success
  end
end
