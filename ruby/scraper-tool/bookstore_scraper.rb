require 'open-uri'
require 'nokogiri'
require_relative 'category'
require_relative 'book'
require_relative 'file_management'

class BookstoreScraper
  BASE_URL = 'http://books.toscrape.com/'.freeze

  def run(argv)
    case argv.first
    when 'view-categories' then list_categories
    when 'list-books' then list_books(argv[1])
    when 'view-book' then display_book(argv[1])
    when 'save-all' then save_all_books_csv_with_thumbnails
    else display_usage
    end
  end

  def parse_html(url)
    Nokogiri::HTML(URI.open(url))
  end

  def list_categories
    parse_html(BASE_URL).search('.side_categories li ul a').each do |anchor_tag|
      Category.new(
        name: anchor_tag.text.strip,
        slug: anchor_tag['href'].split('/')[-2]
      ).display
    end
  end

  def list_books(category_slug)
    books_from_catalogue(parse_html(File.join(BASE_URL, "catalogue/category/books/#{category_slug}")))
      .each(&:display_brief)
  end

  def display_book(book_slug)
    book_parsed_html = parse_html(File.join(BASE_URL, "catalogue/#{book_slug}"))
    Book.new(
      title: book_parsed_html.at('h1').text,
      slug: book_slug,
      picture_url: File.join(BASE_URL, book_parsed_html.at('.thumbnail img')['src'][4..-1]),
      stars: book_parsed_html.at('.star-rating')['class'].split(' ')[1],
      price: book_parsed_html.at('p.price_color').text,
      availability: book_parsed_html.at('.availability').text.strip,
      description: book_parsed_html.at('#product_description').next_sibling.next_sibling.text
    ).display_detail
  end

  def save_all_books_csv_with_thumbnails
    books = all_books
    books_to_csv(books)
    save_book_thumbnails(books)
  end

  def all_books
    books = []
    current_page = 1
    loop do
      catalogue_parsed_html = parse_html(all_books_url(current_page))
      books.concat(books_from_catalogue(catalogue_parsed_html))

      total_pages ||= catalogue_parsed_html.search('.pager .current').text.strip.split(' ').last.to_i
      break if current_page == total_pages

      current_page += 1
    end
    books
  end

  def all_books_url(page_number)
    File.join(BASE_URL, "catalogue/category/books_1/page-#{page_number}.html")
  end

  def books_to_csv(books)
    csv_file = FileManagement.open_write('all_books.csv')
    csv_file.puts Book.csv_header
    books.each { |book| csv_file.puts book.csv_representation }
    csv_file.close
  end

  def save_book_thumbnails(books)
    books.each { |book| FileManagement.save_thumbnail(book.title, URI.open(book.picture_url).read) }
  end

  def books_from_catalogue(catalogue_parsed_html)
    catalogue_parsed_html
      .search('.product_pod')
      .map do |book_parsed_html|
        Book.new(
          title: book_parsed_html.at('h3 > a')['title'],
          slug: book_parsed_html.at('h3 > a')['href'].split('/')[-2],
          picture_url: File.join(BASE_URL, book_parsed_html.at('img.thumbnail')['src'][9..-1]),
          stars: book_parsed_html.at('.star-rating')['class'].split(' ')[1],
          price: book_parsed_html.at('.product_price > p.price_color').text
        )
      end
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

      save-all
      Description: Save all books into CSV file with thumbnails
    USAGE
  end
end

if __FILE__ == $0
  bookstore_scraper = BookstoreScraper.new
  bookstore_scraper.run(ARGV)
end
