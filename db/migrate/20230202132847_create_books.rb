class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true
      t.integer :year
      t.text :detail
      t.timestamps
    end
  end
end
