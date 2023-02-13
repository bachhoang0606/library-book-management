class CreateBorrowPays < ActiveRecord::Migration[6.1]
  def change
    create_table :borrow_pays do |t|
      t.references :library_card, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.date :borrow_date
      t.references :book, null: false, foreign_key: true
      t.text :note
      t.boolean :paid
      t.date :pay_day

      t.timestamps
    end
  end
end
