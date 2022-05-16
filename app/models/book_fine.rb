class BookFine < ApplicationRecord
    paginates_per 4
    belongs_to :issue_book, optional: true
end