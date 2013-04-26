require 'test_helper'

class StampsControllerTest < ActionController::TestCase
  setup do
    @stamp = stamps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stamps)
  end

  test "should create stamp" do
    assert_difference('Stamp.count') do
      post :create, stamp: { completed_at: @stamp.completed_at, duration: @stamp.duration, initials: @stamp.initials, note: @stamp.note, tags: @stamp.tags }
    end

    assert_redirected_to stamp_path(assigns(:stamp))
  end

  test "should destroy stamp" do
    assert_difference('Stamp.count', -1) do
      delete :destroy, id: @stamp
    end

    assert_redirected_to stamps_path
  end
end
