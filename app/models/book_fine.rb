class BookFine < ApplicationRecord
    paginates_per 4
    belongs_to :issue_book, optional: true
    # validates :amount, :user_id, :book_id, :paid, presence: true
end
