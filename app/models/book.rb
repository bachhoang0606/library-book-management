class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher
  has_many :book_review, -> {order "created_at DESC"}
end
