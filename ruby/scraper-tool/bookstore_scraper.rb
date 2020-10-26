require 'open-uri'
require 'nokogiri'
require_relative 'book_basic'
require_relative 'book_detail'

class BookstoreScraper
  BASE_URL = 'http://books.toscrape.com/'.freeze

  def run(argv)
    case argv.first
    when 'view-categories' then list_categories
    when 'list-books' then list_books(argv[1])
    when 'view-book' then display_book(argv[1])
    else display_usage
    end
  end

  def parse_html(url)
    Nokogiri::HTML(URI.open(url))
  end

  def list_categories
    parse_html(BASE_URL).search('.side_categories li ul a').each do |anchor_tag|
      name = anchor_tag.text.strip
      slug = anchor_tag['href'].split('/')[-2]
      puts "#{name}: #{slug}"
    end
  end

  def list_books(category_slug)
    parse_html(File.join(BASE_URL, "catalogue/category/books/#{category_slug}"))
      .search('.product_pod')
      .each do |book_parsed_html|
        BookBasic.new(
          title: book_parsed_html.at('h3 > a')['title'],
          slug: book_parsed_html.at('h3 > a')['href'].split('/')[-2],
          stars: book_parsed_html.at('.star-rating')['class'].split(' ')[1],
          price: book_parsed_html.at('.product_price > p.price_color').text
        ).display
      end
  end

  def display_book(book_slug)
    book_parsed_html = parse_html(File.join(BASE_URL, "catalogue/#{book_slug}"))
    BookDetail.new(
      title: book_parsed_html.at('h1').text,
      price: book_parsed_html.at('p.price_color').text,
      availability: book_parsed_html.at('.availability').text.strip,
      description: book_parsed_html.at('#product_description').next_sibling.next_sibling.text
    ).display
  end

  def display_usage
    print <<~USAGE
      view-categories
      Description: Shows available book categories with their url slug

      list-books <category slug>
      Description: List all books of a specific category
      category slug: obtained from view-categories command
      
      view-book <book slug>
      Description: View detailed data about a book
      book slug: obtained from list-books command
    USAGE
  end
end

if __FILE__ == $0
  bookstore_scraper = BookstoreScraper.new
  bookstore_scraper.run(ARGV)
end
