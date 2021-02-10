class Book < ApplicationRecord
  scope :old, -> { where("published_on < ?", "2019-12-01") }
  scope :price_is, -> (price) { find_by(price: price)}

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }

  validate do |book|
    if book.name.include? "error"
      book.errors[:name] << "error in name"
    end
  end

  before_validation :capitalize_name

  def capitalize_name
    self.name = name.upcase
  end

  after_destroy do
    Rails.logger.info "Book deleted: #{attributes}"
  end

  after_save if: :expensive? do
    Rails.logger.warn "Book made expensive: #{name}"
  end

  def expensive?
    price > 5000
  end

  enum sales_status: {
    reservation: 0,
    now_on_sale: 1,
    end_of_print: 2
  }
end
