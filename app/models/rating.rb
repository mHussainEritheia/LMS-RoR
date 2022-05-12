class Rating < ApplicationRecord
  paginates_per 4
  belongs_to :user
  belongs_to :book
end
