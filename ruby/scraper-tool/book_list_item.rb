class BookListItem
  def initialize(title:, slug:, stars:, price:)
    @title = title
    @slug = slug
    @stars = stars
    @price = price
  end

  def display
    print <<~DATA
      #{@title}
      #{@slug}
      #{@price} | #{@stars}
      
    DATA
  end
end
