class Book < ApplicationRecord
  scope :costly, -> { where("price > ?", 3000)}
  scope :written_about, ->(theme) { where("name like ?", "%#{theme}%") }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal: 0 }
  validate do |book|
    if book.name.include?("exercise")
      book.errors.add(:name, "I don't like exercise")
    end
  end

  before_validation :add_lovely_to_cat

  after_destroy do
    Rails.logger.info "Book is deleted: #{self.attributes}"
  end

  def add_lovely_to_cat
    self.name = self.name.gsub(/Cat/) do |matched|
      "Lovely #{matched}"
    end
  end
end
