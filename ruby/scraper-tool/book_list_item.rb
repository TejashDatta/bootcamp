class BookListItem
  def initialize(html_node)
    @title = html_node.at('h3 > a')['title']
    @slug = html_node.at('h3 > a')['href'].split('/')[-2]
    @stars = html_node.at('.star-rating')['class'].split(' ')[1]
    @price = html_node.at('.product_price > p.price_color').text
  end

  def display
    puts "#{@title} | #{@price} | #{@stars} | #{@slug}"
  end
end
