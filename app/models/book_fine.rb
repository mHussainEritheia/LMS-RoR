class BookFine < ApplicationRecord
    paginates_per 4
    belongs_to :issue_book, optional: true
    scope :dues, -> (user_id) { where(user_id: user_id) }
end 