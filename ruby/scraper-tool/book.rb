class Book
  CSV_DELIMITER = ';'.freeze

  def self.csv_header
    %w[title slug stars price].join(CSV_DELIMITER)
  end

  attr_reader :title, :picture_url

  def initialize(title:, slug:, picture_url:, stars:, price:, availability: '', description: '')
    @title = title
    @slug = slug
    @picture_url = picture_url
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
