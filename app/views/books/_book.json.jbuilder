json.extract! book, :id, :name, :category_id, :publisher_id, :year, :created_at, :updated_at
json.url book_url(book, format: :json)
