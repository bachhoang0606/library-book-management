class BorrowPay < ApplicationRecord
  belongs_to :library_card
  belongs_to :admin
  belongs_to :book

  validate :card_has_expired, :card_is_exit, :book_is_exit

  private 

  def card_has_expired
    library_card = LibraryCard.find_by_id(library_card_id)
    if library_card && library_card.expiration_date < Date.today
      errors.add(:library_card_id, "図書カードの有効期限が切れています")
    end
  end

  def card_is_exit
    library_card = LibraryCard.find_by_id(library_card_id)
    if library_card == nil
      errors.add(:library_card_id, "図書カードが存在しません")
    end
  end

  def book_is_exit
    book = Book.find_by_id(book_id)
    if book == nil
      errors.add(:book_id, "本のコードが存在しません")
    end
  end
end
