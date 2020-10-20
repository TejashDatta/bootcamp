class BookDetail
  def initialize(html_node)
    @title = html_node.at('h1').text
    @price = html_node.at('p.price_color').text
    @availability = html_node.at('.availability').text.strip
    @description = html_node.at('#product_description').next_sibling.next_sibling.text
  end

  def display
    print <<~DATA
      Title: #{@title}
      Price: #{@price}
      Availability: #{@availability}
      Description:
      #{@description}
    DATA
  end
end
