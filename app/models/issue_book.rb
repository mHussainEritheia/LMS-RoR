class IssueBook < ApplicationRecord
    belongs_to :user
    belongs_to :book
    has_one :book_fine
end
 