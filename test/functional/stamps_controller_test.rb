require 'test_helper'

class StampsControllerTest < ActionController::TestCase
  setup do
    @stamp = stamps(:microsoft_hacking)
  end

  test "should create stamp with valid attributes" do
    assert_difference('Stamp.count') do
      post :create, stamp: {
        completed_at: @stamp.completed_at,
        duration:     @stamp.duration,
        initials:     @stamp.initials,
        card_id:      @stamp.card_id
      }
    end
    assert_equal 'Stamp was successfully created.', flash[:notice]
    assert_redirected_to card_path(@stamp.card)
  end

  test "should not create stamp with invalid attributes" do
    assert_no_difference('Stamp.count') do
      post :create, stamp: {card_id: @stamp.card_id}
    end
    assert_equal 'Error(s) prohibited this stamp from being saved.', flash[:alert]
    assert_redirected_to card_path(@stamp.card)
  end

  test "should destroy stamp" do
    assert_difference('Stamp.count', -1) do
      delete :destroy, id: @stamp
    end

    assert_redirected_to card_path(@stamp.card)
  end
end
