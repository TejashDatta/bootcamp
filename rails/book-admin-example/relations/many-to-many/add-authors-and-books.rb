tejash = Author.create(name: "Tejash Datta", penname: "Teja")
ujan = Author.create(name: "Ujan Sengupta", penname: "Chhotu")

tejash.books << Book.find(1)

tejash.reload.books.count

book = Book.find(1)
book.authors << ujan
book.reload.authors.pluck(:name)
