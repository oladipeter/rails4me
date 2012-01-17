require 'test_helper'

class DescribesControllerTest < ActionController::TestCase
  setup do
    @describe = describes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:describes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create describe" do
    assert_difference('Describe.count') do
      post :create, :describe => @describe.attributes
    end

    assert_redirected_to describe_path(assigns(:describe))
  end

  test "should show describe" do
    get :show, :id => @describe.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @describe.to_param
    assert_response :success
  end

  test "should update describe" do
    put :update, :id => @describe.to_param, :describe => @describe.attributes
    assert_redirected_to describe_path(assigns(:describe))
  end

  test "should destroy describe" do
    assert_difference('Describe.count', -1) do
      delete :destroy, :id => @describe.to_param
    end

    assert_redirected_to describes_path
  end
end
