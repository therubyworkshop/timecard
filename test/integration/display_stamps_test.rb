require "test_helper"

class DisplayStampsTest < ActionDispatch::IntegrationTest
  setup do
    @card  = cards(:apple)
    @stamp = stamps(:apple_ux)
    visit "/"
    click_link @card.name
  end

  test "listing stamps for a card" do
    unrelated_stamp = stamps(:intel_design)
    assert page.has_content? @stamp.note
    assert page.has_no_content? unrelated_stamp.note
  end
end
