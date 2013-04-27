require 'test_helper'

class CardTest < ActiveSupport::TestCase
  setup do
    card = Card.new
    card.valid?
    @error_messages = card.errors.messages
  end

  test "has error on name when blank" do
    assert_include @error_messages[:name], "can't be blank"
  end

  test "has error on rate when blank" do
    assert_include @error_messages[:rate], "can't be blank"
  end

  test "has error on name when it's not unique" do
    card = Card.new name: cards(:microsoft).name
    card.valid?
    assert_include card.errors.messages[:name], "has already been taken"
  end
end
