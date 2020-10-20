require 'nokogiri'
require 'open-uri'

def scraping
  url = 'http://books.toscrape.com/catalogue/category/books/philosophy_7/index.html'
  html = URI.open(url)
  doc = Nokogiri::HTML(html)
  products = doc.search('.product_pod')


  total = doc.at('.form-horizontal strong')

  puts "#{total.text}"

  products.each do |product|
    name = product.at('h3 > a')['title']
    slug = product.at('h3 > a')['href'].split('/')[-2]
    stars = product.at('.star-rating')['class'].split(' ')[1]
    price = product.at('.product_price > p.price_color').text
    puts "#{name}: #{price}: #{stars} - #{slug}"
  end

end


def categories
  url = 'http://books.toscrape.com/'
  html = URI.open(url)
  doc = Nokogiri::HTML(html)

  categories = doc.at('.side_categories').search('a')
  categories.each do |category_link|
    link = File.dirname(category_link['href'])
    name = category_link.text.strip
    puts "#{name} -- #{link}"
  end
end

# scraping

categories

def book
  url = 'http://books.toscrape.com/catalogue/the-death-of-humanity-and-the-case-for-life_932/index.html'
  html = URI.open(url)
  doc = Nokogiri::HTML(html)

  heading = doc.at('h1').text
  price = doc.at('p.price_color').text
  availability = doc.at('.availability').text

  prod_desc = doc.at('#product_description').next_sibling.next_sibling.text

  # puts heading,price, availability
  p prod_desc

end

# book
