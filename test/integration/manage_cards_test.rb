require "test_helper"

class ManageCardsTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:intel)
    visit "/"
  end

  test "creating a card" do
    click_link "New Card"
    fill_in "Name", with: "Bacon"
    fill_in "Rate", with: "123"
    click_button "Save Card"
    assert page.has_content? "Bacon"
  end

  test "edit a card" do
    within "tr#card_#{@card.id}"do
      click_link "Edit"
    end
    fill_in "Rate", with: "1000"
    click_button "Save Card"
    assert page.has_content? "Card was successfully updated"
    within "tr#card_#{@card.id}"do
      assert page.has_content? "1000"
    end
  end

  test "delete a card" do
    assert page.has_content? "Intel"
    within "tr#card_#{@card.id}"do
      click_link "Delete"
    end
    assert page.has_no_content? "Intel"
  end
end
