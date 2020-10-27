class Book
  CSV_DELIMITER = ';'.freeze

  def self.csv_header
    %w[title slug stars price].join(CSV_DELIMITER)
  end

  def initialize(title:, slug:, stars:, price:, availability: '', description: '')
    @title = title
    @slug = slug
    @stars = stars
    @price = price
    @availability = availability
    @description = description
  end

  def display_brief
    print <<~DATA
      #{@title}
      #{@slug}
      #{@price} | #{@stars}
      
    DATA
  end

  def display_detail
    print <<~DATA
      Title: #{@title}
      Price: #{@price}
      Stars: #{@stars}
      Availability: #{@availability}
      Description:
      #{@description}
    DATA
  end

  def csv_representation
    [@title, @slug, @stars, @price].join(CSV_DELIMITER)
  end
end
