class BookCategory < ApplicationRecord
    paginates_per 4
    has_many :books, :dependent => :destroy
end
