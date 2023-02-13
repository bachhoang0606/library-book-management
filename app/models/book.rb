class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher
  belongs_to :author
  has_one_attached :image
  has_many :book_review, -> {order "created_at DESC"}
end
