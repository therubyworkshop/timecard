require "test_helper"

class DisplayCardsTest < ActionDispatch::IntegrationTest
  setup do
    visit "/"
  end

  test "listing cards" do
    assert page.has_content? cards(:microsoft).name
    assert page.has_content? cards(:apple).name
    assert page.has_content? cards(:intel).name
  end

  test "listing cards includes total hours per card" do
    card = cards(:microsoft)
    total_duration = stamps(:microsoft_hacking).duration + stamps(:microsoft_bug_fixin).duration
    within "tr#card_#{card.id}"do
      assert page.has_content? total_duration.round(2)
    end
  end

  test "viewing card detail" do
    card = cards(:intel)
    click_link card.name
    assert page.has_content? card.name
    assert page.has_content? card.rate.round
  end

  test "returning to card list from detail" do
    click_link cards(:intel).name
    click_link "Cards"
    assert page.has_content? cards(:microsoft).name
    assert page.has_content? cards(:apple).name
  end
end
