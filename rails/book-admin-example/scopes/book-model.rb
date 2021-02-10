class Book < ApplicationRecord
  scope :old, -> { where('published_on < ?', '2019-12-01') }
  scope :price_is, ->(price) { find_by(price: price) }
end
