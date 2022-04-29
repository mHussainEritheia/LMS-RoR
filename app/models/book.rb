class Book < ApplicationRecord
    paginates_per 4
    belongs_to :book_category
    has_many :requested_books
    has_many :users, through: :requested_books
    has_many :issue_books
    has_many :users, through: :issue_books
end
  