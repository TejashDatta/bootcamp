json.extract! @book, :id, :name, :price
json.name_with_id "#{@book.id} - #{@book.name}"
json.publisher do
  json.name @book.publisher.name
  json.extract! @book.publisher, :address
end
if @book.expensive?
  json.expensive true
end

json.books Book.all do |book|
  json.extract! book, :id, :name, :price
end
