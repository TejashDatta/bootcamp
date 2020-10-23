class BookDetail
  def initialize(title:, price:, availability:, description:)
    @title = title
    @price = price
    @availability = availability
    @description = description
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
