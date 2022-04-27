class Book < ApplicationRecord
    belongs_to :book_category
    has_many :requested_books
    has_many :users, through: :requested_books
    has_many :issue_books
    has_many :users, through: :issue_books
end
  