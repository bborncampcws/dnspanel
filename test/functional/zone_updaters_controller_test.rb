require 'test_helper'

class ZoneUpdatersControllerTest < ActionController::TestCase
  setup do
    @zone_updater = zone_updaters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zone_updaters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zone_updater" do
    assert_difference('ZoneUpdater.count') do
      post :create, zone_updater: { algorithim: @zone_updater.algorithim, key: @zone_updater.key, server: @zone_updater.server }
    end

    assert_redirected_to zone_updater_path(assigns(:zone_updater))
  end

  test "should show zone_updater" do
    get :show, id: @zone_updater
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zone_updater
    assert_response :success
  end

  test "should update zone_updater" do
    put :update, id: @zone_updater, zone_updater: { algorithim: @zone_updater.algorithim, key: @zone_updater.key, server: @zone_updater.server }
    assert_redirected_to zone_updater_path(assigns(:zone_updater))
  end

  test "should destroy zone_updater" do
    assert_difference('ZoneUpdater.count', -1) do
      delete :destroy, id: @zone_updater
    end

    assert_redirected_to zone_updaters_path
  end
end
