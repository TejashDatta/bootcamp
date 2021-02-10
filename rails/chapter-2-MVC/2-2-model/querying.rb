Book.find(1)
Book.first
Book.last

Book.find_by(name: "Book 3")
Book.find_by(price: 2000)

Book.where("price < ?", 2500)
Book.where("price > ?", 2500).order(:price).limit(3)
