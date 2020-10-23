require 'open-uri'
require 'nokogiri'
require_relative 'book_list_item'
require_relative 'book_detail'

class BookstoreScraper
  BASE_URL = 'http://books.toscrape.com/'.freeze

  def run(argv)
    case argv[0]
    when 'view-categories' then display_categories
    when 'list-books' then display_books(argv[1])
    when 'view-book' then display_book(argv[1])
    else display_usage
    end
  end

  def parse_url(url)
    html = URI.open(url)
    Nokogiri::HTML(html)
  end

  def display_categories
    parse_url(BASE_URL).search('.side_categories a').each do |link|
      puts "#{link.text.strip}: #{link['href'].split('/')[-2]}"
    end
  end

  def display_books(category_slug)
    parse_book_list_page(category_slug)
      .search('.product_pod')
      .each do |book_list_item_parsed_html|
        create_book_list_item(book_list_item_parsed_html).display
      end
  end

  def parse_book_list_page(category_slug)
    parse_url(build_book_list_url(category_slug))
  end

  def build_book_list_url(category_slug)
    File.join(BASE_URL, "catalogue/category/books/#{category_slug}")
  end

  def create_book_list_item(parsed_html)
    BookListItem.new(
      title: parsed_html.at('h3 > a')['title'],
      slug: parsed_html.at('h3 > a')['href'].split('/')[-2],
      stars: parsed_html.at('.star-rating')['class'].split(' ')[1],
      price: parsed_html.at('.product_price > p.price_color').text
    )
  end

  def display_book(book_slug)
    create_book_detail(parse_book_page(book_slug)).display
  end

  def parse_book_page(book_slug)
    parse_url(build_book_url(book_slug))
  end

  def build_book_url(book_slug)
    File.join(BASE_URL, "catalogue/#{book_slug}")
  end

  def create_book_detail(parsed_html)
    BookDetail.new(
      title: parsed_html.at('h1').text,
      price: parsed_html.at('p.price_color').text,
      availability: parsed_html.at('.availability').text.strip,
      description: parsed_html.at('#product_description').next_sibling.next_sibling.text
    )
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
