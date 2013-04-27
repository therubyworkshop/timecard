require "test_helper"

class ManageStampsTest < ActionDispatch::IntegrationTest
  setup do
    @card  = cards(:apple)
    @stamp = stamps(:apple_ux)
    visit "/"
    click_link @card.name
  end

  test "creating a stamp" do
    fill_in "Initials", with: "WHO"
    fill_in "Note",     with: "Siri"
    fill_in "Duration", with: "3.33"
    click_button "Save Stamp"
    assert page.has_content? "Siri"
  end

  test "delete a stamp" do
    assert page.has_content? @stamp.note
    within "tr#stamp_#{@stamp.id}"do
      click_link "Delete"
    end
    assert page.has_no_content? @stamp.note
  end
end
