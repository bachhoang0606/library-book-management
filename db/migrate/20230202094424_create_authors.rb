class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :website
      t.text :note

      t.timestamps
    end
  end
end
