class Book < ApplicationRecord
    paginates_per 4
    has_many :ratings, :dependent => :destroy
    belongs_to :book_category
    has_many :requested_books, :dependent => :destroy
    has_many :users, through: :requested_books
    has_many :issue_books, :dependent => :destroy
    has_many :users, through: :issue_books
    has_one_attached :image, :dependent => :destroy
    validates :name, :author, :publication_year, :book_category_id, :image, presence: true
end