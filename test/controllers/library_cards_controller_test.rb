require "test_helper"

class LibraryCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library_card = library_cards(:one)
  end

  test "should get index" do
    get library_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_library_card_url
    assert_response :success
  end

  test "should create library_card" do
    assert_difference('LibraryCard.count') do
      post library_cards_url, params: { library_card: { expiration_date: @library_card.expiration_date, note: @library_card.note, start_date: @library_card.start_date } }
    end

    assert_redirected_to library_card_url(LibraryCard.last)
  end

  test "should show library_card" do
    get library_card_url(@library_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_library_card_url(@library_card)
    assert_response :success
  end

  test "should update library_card" do
    patch library_card_url(@library_card), params: { library_card: { expiration_date: @library_card.expiration_date, note: @library_card.note, start_date: @library_card.start_date } }
    assert_redirected_to library_card_url(@library_card)
  end

  test "should destroy library_card" do
    assert_difference('LibraryCard.count', -1) do
      delete library_card_url(@library_card)
    end

    assert_redirected_to library_cards_url
  end
end
