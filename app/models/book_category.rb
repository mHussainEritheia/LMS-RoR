class BookCategory < ApplicationRecord
    paginates_per 4
    has_many :books, :dependent => :destroy
    validates :name, presence: true
    scope :category_find, -> (category_id) {find_by(id: category_id)}
end