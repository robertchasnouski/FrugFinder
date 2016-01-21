require 'test_helper'

class SearchLinesControllerTest < ActionController::TestCase
  setup do
    @search_line = search_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_line" do
    assert_difference('SearchLine.count') do
      post :create, search_line: { name: @search_line.name, user_name: @search_line.user_name }
    end

    assert_redirected_to search_line_path(assigns(:search_line))
  end

  test "should show search_line" do
    get :show, id: @search_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_line
    assert_response :success
  end

  test "should update search_line" do
    patch :update, id: @search_line, search_line: { name: @search_line.name, user_name: @search_line.user_name }
    assert_redirected_to search_line_path(assigns(:search_line))
  end

  test "should destroy search_line" do
    assert_difference('SearchLine.count', -1) do
      delete :destroy, id: @search_line
    end

    assert_redirected_to search_lines_path
  end
end
