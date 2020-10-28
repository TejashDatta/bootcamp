require 'open-uri'
require 'nokogiri'
require_relative 'category'
require_relative 'book'
require_relative 'file_management'

class BookstoreScraper
  BASE_URL = 'http://books.toscrape.com/'.freeze
  ALL_BOOKS_BASE_URL = File.join(BASE_URL, 'catalogue/category/books_1')
  CATEGORY_BOOKS_BASE_URL = File.join(BASE_URL, 'catalogue/category/books')
  BOOK_BASE_URL = File.join(BASE_URL, 'catalogue')

  def initialize
    @books = []
    @catalogue_page_count = nil
  end

  def run(command, slug = nil)
    case command
    when 'display-categories' then display_categories
    when 'display-books-of-category' then display_books_of_category(slug)
    when 'display-book' then display_book(slug)
    when 'save-all-books-csv-with-thumbnails' then save_all_books_csv_with_thumbnails
    else display_usage
    end
  end

  def parse_html(url)
    Nokogiri::HTML(URI.open(url))
  end

  def display_categories
    parse_html(BASE_URL).search('.side_categories li ul a').each do |anchor_tag|
      Category.new(
        name: anchor_tag.text.strip,
        slug: anchor_tag['href'].split('/')[-2]
      ).display
    end
  end

  def display_books_of_category(category_slug)
    @books = books_from_catalogue(parse_html(File.join(CATEGORY_BOOKS_BASE_URL, category_slug)))
    @books.each(&:display_brief)
  end

  def display_book(book_slug)
    book_from_product_page(parse_html(File.join(BOOK_BASE_URL, book_slug))).display_detail
  end

  def book_from_product_page(book_parsed_html)
    Book.new(
      title: book_parsed_html.at('h1').text,
      image_url: File.join(BASE_URL, book_parsed_html.at('.thumbnail img')['src'][4..-1]),
      stars: book_parsed_html.at('.star-rating')['class'].split(' ')[1],
      price: book_parsed_html.at('p.price_color').text,
      availability: book_parsed_html.at('.availability').text.strip,
      description: book_parsed_html.at('#product_description').next_sibling.next_sibling.text
    )
  end

  def save_all_books_csv_with_thumbnails
    get_all_books
    books_to_csv
    save_thumbnails_of_books
  end

  def get_all_books
    current_page = 1
    loop do
      catalogue_parsed_html = parse_html(all_books_url(current_page))
      @books.concat(books_from_catalogue(catalogue_parsed_html))

      @catalogue_page_count ||= extract_catalogue_page_count(catalogue_parsed_html)

      break if current_page == @catalogue_page_count

      current_page += 1
    end
  end

  def all_books_url(page_number)
    File.join(ALL_BOOKS_BASE_URL, "page-#{page_number}.html")
  end

  def extract_catalogue_page_count(catalogue_parsed_html)
    catalogue_parsed_html.search('.pager .current').text.strip.split(' ').last.to_i
  end

  def books_to_csv
    FileManagement.open_write('all_books.csv') do |csv_file|
      csv_file.puts Book.csv_header
      @books.each { |book| csv_file.puts book.csv_representation }
    end
  end

  def save_thumbnails_of_books
    @books.each { |book| FileManagement.save_thumbnail(book.title, URI.open(book.image_url).read) }
  end

  def books_from_catalogue(catalogue_parsed_html)
    catalogue_parsed_html
      .search('.product_pod')
      .map do |book_parsed_html|
        Book.new(
          title: book_parsed_html.at('h3 > a')['title'],
          image_url: File.join(BASE_URL, book_parsed_html.at('img.thumbnail')['src'][9..-1]),
          stars: book_parsed_html.at('.star-rating')['class'].split(' ')[1],
          price: book_parsed_html.at('.product_price > p.price_color').text,
          slug: book_parsed_html.at('h3 > a')['href'].split('/')[-2]
        )
      end
  end
end

if __FILE__ == $0
  bookstore_scraper = BookstoreScraper.new
  bookstore_scraper.run(*ARGV)
end

def display_usage
  print <<~USAGE
    display-categories
    Description: Shows available book categories with their url slug

    display-books-of-category <category slug>
    Description: List all books of a specific category
    category slug: obtained from view-categories command
    
    display-book <book slug>
    Description: View detailed data about a book
    book slug: obtained from list-books command

    save-all-books-csv-with-thumbnails
    Description: Save all books into CSV file with thumbnails
  USAGE
end
