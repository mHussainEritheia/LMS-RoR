class Admin::BookfinesController < ApplicationController
    def index
        @book_fines = BookFine.all
    end
end
