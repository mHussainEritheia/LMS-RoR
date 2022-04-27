class RequestedBook < ApplicationRecord
    belongs_to :user
    belongs_to :book
    enum status: [:pending, :approved, :rejected], _default: "pending"
end
  