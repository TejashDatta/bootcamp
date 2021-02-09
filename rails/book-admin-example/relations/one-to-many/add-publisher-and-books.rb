publisher = Publisher.create(
  name: "Penguin inc.",
  address: "South pole"
)

publisher.books << Book.create(
  name: "Flight guide",
  published_on: Time.current,
  price: 3000
)

publisher.books

book = Book.find_by(name: "Flight guide")
book.publisher.name
