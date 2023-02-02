class CreateLibraryCards < ActiveRecord::Migration[6.1]
  def change
    create_table :library_cards do |t|
      t.date :start_date
      t.date :expiration_date
      t.text :note

      t.timestamps
    end
  end
end
