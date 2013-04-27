require 'test_helper'

class StampTest < ActiveSupport::TestCase
  setup do
    stamp = Stamp.new
    stamp.valid?
    @error_messages = stamp.errors.messages
  end

  test "has error on initials when blank" do
    assert_includes @error_messages[:initials], "can't be blank"
  end

  test "has error on duration when blank" do
    assert_includes @error_messages[:duration], "can't be blank"
  end

  test "has error on completed_at when blank" do
    assert_includes @error_messages[:completed_at], "can't be blank"
  end

  test "has error on card_id when blank" do
    assert_includes @error_messages[:card_id], "can't be blank"
  end
end
