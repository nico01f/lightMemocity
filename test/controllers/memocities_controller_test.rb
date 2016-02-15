require 'test_helper'

class MemocitiesControllerTest < ActionController::TestCase
  setup do
    @memocity = memocities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memocities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memocity" do
    assert_difference('Memocity.count') do
      post :create, memocity: { activationDateMemo: @memocity.activationDateMemo, contentMemo: @memocity.contentMemo, phoneNumberMemo: @memocity.phoneNumberMemo }
    end

    assert_redirected_to memocity_path(assigns(:memocity))
  end

  test "should show memocity" do
    get :show, id: @memocity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memocity
    assert_response :success
  end

  test "should update memocity" do
    patch :update, id: @memocity, memocity: { activationDateMemo: @memocity.activationDateMemo, contentMemo: @memocity.contentMemo, phoneNumberMemo: @memocity.phoneNumberMemo }
    assert_redirected_to memocity_path(assigns(:memocity))
  end

  test "should destroy memocity" do
    assert_difference('Memocity.count', -1) do
      delete :destroy, id: @memocity
    end

    assert_redirected_to memocities_path
  end
end
