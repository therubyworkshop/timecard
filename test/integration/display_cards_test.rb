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

  test "viewing card detail" do
    card = cards(:intel)
    click_link card.name
    assert page.has_content? card.name
    assert page.has_content? card.rate.round
  end
end
