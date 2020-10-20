require 'open-uri'
require 'nokogiri'
require_relative 'book_list'
require_relative 'book_detail'

class BookstoreScraper
  HOST = 'http://books.toscrape.com/'.freeze

  def initialize; end

  def run(argv)
    command = argv[0]
    case command
    when 'view-categories' then display_categories
    when 'list-books' then display_books(**parse_options(argv[1..-1]))
    when 'view-book' then display_book(argv[1])
    else display_usage
    end
  end

  def parse_url(url)
    html = URI.open(url)
    Nokogiri::HTML(html)
  end

  def display_categories
    document = parse_url(HOST)

    puts '<Name: Slug>'

    category_links = document.at('.side_categories').search('a')
    category_links.each do |link|
      name = link.text.strip
      slug = link['href'].split('/')[-2]
      puts "#{name}: #{slug}"
    end
  end

  def display_books(category_slug: nil, page: nil)
    url = build_book_list_url(category_slug, page)
    document = parse_url(url)

    book_count = document.at('.form-horizontal strong').text
    puts "#{book_count} books"

    book_listings = document.search('.product_pod')
    book_list = BookList.new(book_listings)
    book_list.display

    display_page_number(document)
  end

  def display_book(slug)
    url = File.join(HOST, "catalogue/#{slug}")
    document = parse_url(url)

    book = BookDetail.new(document)
    book.display
  end

  def display_usage
    print <<~USAGE
      view-categories
      Description: Shows available book categories with their url slug

      list-books <option: category slug> <option: page number>
      Description: list all books or of a specific category by page
      category slug: default is all (slugs obtained by view categories command) 
      page number: default is 1
      
      view-book <book slug>
      Description: View detailed data about a book
    USAGE
  end

  private

  def build_book_list_url(category_slug, page)
    url = if category_slug.nil?
            File.join(HOST, 'catalogue/category/books_1')
          else
            File.join(HOST, "catalogue/category/books/#{category_slug}")
          end

    url = File.join(url, "page-#{page}.html") unless page.nil? || page == 1
    url
  end

  def display_page_number(html_node)
    page_description = html_node.at('ul.pager li.current')
    if page_description.nil?
      puts 'Page 1 of 1'
    else
      puts page_description.text.strip
    end
  end

  def parse_options(options_array)
    options = {}
    options_array.each do |string|
      option, value = string.split('=')
      options[option.to_sym] = value
    end
    options
  end
end

if __FILE__ == $PROGRAM_NAME
  bookstore_scraper = BookstoreScraper.new
  bookstore_scraper.run(ARGV)
end
