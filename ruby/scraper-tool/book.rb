class Book
  CSV_DELIMITER = ','.freeze

  def self.csv_header
    %w[title slug stars price].join(CSV_DELIMITER)
  end

  attr_reader :title, :image_url

  def initialize(title:, image_url:, stars:, price:, slug: '', availability: '', description: '')
    @title = title
    @image_url = image_url
    @stars = stars
    @price = price
    @slug = slug
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
    [%("#{@title}"), @slug, @stars, @price].join(CSV_DELIMITER)
  end
end
