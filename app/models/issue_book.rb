class IssueBook < ApplicationRecord
    paginates_per 4
    belongs_to :user
    belongs_to :book
    has_one :book_fine
end
 