require "test_helper"

class BorrowPaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borrow_pay = borrow_pays(:one)
  end

  test "should get index" do
    get borrow_pays_url
    assert_response :success
  end

  test "should get new" do
    get new_borrow_pay_url
    assert_response :success
  end

  test "should create borrow_pay" do
    assert_difference('BorrowPay.count') do
      post borrow_pays_url, params: { borrow_pay: { admin_id: @borrow_pay.admin_id, book_id: @borrow_pay.book_id, borrow_date: @borrow_pay.borrow_date, library_card_id: @borrow_pay.library_card_id, note: @borrow_pay.note, paid: @borrow_pay.paid, pay_day: @borrow_pay.pay_day } }
    end

    assert_redirected_to borrow_pay_url(BorrowPay.last)
  end

  test "should show borrow_pay" do
    get borrow_pay_url(@borrow_pay)
    assert_response :success
  end

  test "should get edit" do
    get edit_borrow_pay_url(@borrow_pay)
    assert_response :success
  end

  test "should update borrow_pay" do
    patch borrow_pay_url(@borrow_pay), params: { borrow_pay: { admin_id: @borrow_pay.admin_id, book_id: @borrow_pay.book_id, borrow_date: @borrow_pay.borrow_date, library_card_id: @borrow_pay.library_card_id, note: @borrow_pay.note, paid: @borrow_pay.paid, pay_day: @borrow_pay.pay_day } }
    assert_redirected_to borrow_pay_url(@borrow_pay)
  end

  test "should destroy borrow_pay" do
    assert_difference('BorrowPay.count', -1) do
      delete borrow_pay_url(@borrow_pay)
    end

    assert_redirected_to borrow_pays_url
  end
end
