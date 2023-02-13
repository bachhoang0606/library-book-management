require "test_helper"

class BookReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_review = book_reviews(:one)
  end

  test "should get index" do
    get book_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_book_review_url
    assert_response :success
  end

  test "should create book_review" do
    assert_difference('BookReview.count') do
      post book_reviews_url, params: { book_review: { book_id: @book_review.book_id, review: @book_review.review, user_id: @book_review.user_id } }
    end

    assert_redirected_to book_review_url(BookReview.last)
  end

  test "should show book_review" do
    get book_review_url(@book_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_review_url(@book_review)
    assert_response :success
  end

  test "should update book_review" do
    patch book_review_url(@book_review), params: { book_review: { book_id: @book_review.book_id, review: @book_review.review, user_id: @book_review.user_id } }
    assert_redirected_to book_review_url(@book_review)
  end

  test "should destroy book_review" do
    assert_difference('BookReview.count', -1) do
      delete book_review_url(@book_review)
    end

    assert_redirected_to book_reviews_url
  end
end
