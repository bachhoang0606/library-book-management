require "application_system_test_case"

class BorrowPaysTest < ApplicationSystemTestCase
  setup do
    @borrow_pay = borrow_pays(:one)
  end

  test "visiting the index" do
    visit borrow_pays_url
    assert_selector "h1", text: "Borrow Pays"
  end

  test "creating a Borrow pay" do
    visit borrow_pays_url
    click_on "New Borrow Pay"

    fill_in "Admin", with: @borrow_pay.admin_id
    fill_in "Book", with: @borrow_pay.book_id
    fill_in "Borrow date", with: @borrow_pay.borrow_date
    fill_in "Library card", with: @borrow_pay.library_card_id
    fill_in "Note", with: @borrow_pay.note
    check "Paid" if @borrow_pay.paid
    fill_in "Pay day", with: @borrow_pay.pay_day
    click_on "Create Borrow pay"

    assert_text "Borrow pay was successfully created"
    click_on "Back"
  end

  test "updating a Borrow pay" do
    visit borrow_pays_url
    click_on "Edit", match: :first

    fill_in "Admin", with: @borrow_pay.admin_id
    fill_in "Book", with: @borrow_pay.book_id
    fill_in "Borrow date", with: @borrow_pay.borrow_date
    fill_in "Library card", with: @borrow_pay.library_card_id
    fill_in "Note", with: @borrow_pay.note
    check "Paid" if @borrow_pay.paid
    fill_in "Pay day", with: @borrow_pay.pay_day
    click_on "Update Borrow pay"

    assert_text "Borrow pay was successfully updated"
    click_on "Back"
  end

  test "destroying a Borrow pay" do
    visit borrow_pays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Borrow pay was successfully destroyed"
  end
end
