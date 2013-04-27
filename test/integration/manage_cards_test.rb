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

  test "creating a card with missing field" do
    click_link "New Card"
    fill_in "Name", with: ""
    click_button "Save Card"
    assert page.has_content? "can't be blank"
  end

  test "creating a card with duplicate name" do
    # TODO #1
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

  test "returning to card list from edit" do
    within "tr#card_#{@card.id}"do
      click_link "Edit"
    end
    click_link "Cards"
    assert page.has_content? cards(:microsoft).name
    assert page.has_content? cards(:apple).name
  end
end
