class CreateBookReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :book_reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :review

      t.timestamps
    end
  end
end
