class RequestedBook < ApplicationRecord
    paginates_per 4
    belongs_to :user
    belongs_to :book
    enum status: [:pending, :approved, :rejected], _default: "pending"
end
  