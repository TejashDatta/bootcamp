class Bookshelf
  attr_accessor :genre, :dimensions, :material, :capacity, :shelf_count

  def initialize(*books)
    @books = books.dup
  end

  def volume
    @dimensions.reduce(1) { |volume, dimension| volume * dimension }
  end

  def add_book(book)
    @books.push(book)
  end

  def remove_book(book)
    @books.delete(book)
  end

  def book_count
    @books.size
  end

  def display_books
    @books.each { |book| puts book }
  end
end

bedroom_bookshelf = Bookshelf.new('Harry Potter', 'Final Fantasy')
bedroom_bookshelf.display_books

puts bedroom_bookshelf.dimensions
