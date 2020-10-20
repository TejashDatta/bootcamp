require_relative 'book_list_item'

class BookList
  def initialize(html_node_list)
    @books = []
    populate_books(html_node_list)
  end

  def populate_books(html_node_list)
    html_node_list.each { |node| @books << BookListItem.new(node) }
  end

  def display
    @books.each(&:display)
  end
end
