require "application_system_test_case"

class LibraryCardsTest < ApplicationSystemTestCase
  setup do
    @library_card = library_cards(:one)
  end

  test "visiting the index" do
    visit library_cards_url
    assert_selector "h1", text: "Library Cards"
  end

  test "creating a Library card" do
    visit library_cards_url
    click_on "New Library Card"

    fill_in "Expiration date", with: @library_card.expiration_date
    fill_in "Note", with: @library_card.note
    fill_in "Start date", with: @library_card.start_date
    click_on "Create Library card"

    assert_text "Library card was successfully created"
    click_on "Back"
  end

  test "updating a Library card" do
    visit library_cards_url
    click_on "Edit", match: :first

    fill_in "Expiration date", with: @library_card.expiration_date
    fill_in "Note", with: @library_card.note
    fill_in "Start date", with: @library_card.start_date
    click_on "Update Library card"

    assert_text "Library card was successfully updated"
    click_on "Back"
  end

  test "destroying a Library card" do
    visit library_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Library card was successfully destroyed"
  end
end
