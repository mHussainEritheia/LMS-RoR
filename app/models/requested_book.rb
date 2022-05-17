class RequestedBook < ApplicationRecord
    paginates_per 4
    belongs_to :user
    belongs_to :book
    enum status: [:pending, :approved, :rejected], _default: "pending"
    scope :status_approved, -> { where(status: "approved") }
    scope :status_pending, -> { where(status: "pending") }
    scope :status_rejected,-> { where(status: "rejected") }
    scope :user_req_books, -> (user_id){ where(user_id: user_id) }
end