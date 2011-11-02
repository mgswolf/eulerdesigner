require 'test_helper'

class Admin::TrabalhosControllerTest < ActionController::TestCase
  setup do
    @admin_trabalho = admin_trabalhos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_trabalhos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_trabalho" do
    assert_difference('Admin::Trabalho.count') do
      post :create, admin_trabalho: @admin_trabalho.attributes
    end

    assert_redirected_to admin_trabalho_path(assigns(:admin_trabalho))
  end

  test "should show admin_trabalho" do
    get :show, id: @admin_trabalho.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_trabalho.to_param
    assert_response :success
  end

  test "should update admin_trabalho" do
    put :update, id: @admin_trabalho.to_param, admin_trabalho: @admin_trabalho.attributes
    assert_redirected_to admin_trabalho_path(assigns(:admin_trabalho))
  end

  test "should destroy admin_trabalho" do
    assert_difference('Admin::Trabalho.count', -1) do
      delete :destroy, id: @admin_trabalho.to_param
    end

    assert_redirected_to admin_trabalhos_path
  end
end
