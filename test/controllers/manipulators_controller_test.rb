require 'test_helper'

class ManipulatorsControllerTest < ActionController::TestCase
  setup do
    @manipulator = manipulators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manipulators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manipulator" do
    assert_difference('Manipulator.count') do
      post :create, manipulator: { m_name: @manipulator.m_name, m_type: @manipulator.m_type, password: @manipulator.password }
    end

    assert_redirected_to manipulator_path(assigns(:manipulator))
  end

  test "should show manipulator" do
    get :show, id: @manipulator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manipulator
    assert_response :success
  end

  test "should update manipulator" do
    patch :update, id: @manipulator, manipulator: { m_name: @manipulator.m_name, m_type: @manipulator.m_type, password: @manipulator.password }
    assert_redirected_to manipulator_path(assigns(:manipulator))
  end

  test "should destroy manipulator" do
    assert_difference('Manipulator.count', -1) do
      delete :destroy, id: @manipulator
    end

    assert_redirected_to manipulators_path
  end
end
