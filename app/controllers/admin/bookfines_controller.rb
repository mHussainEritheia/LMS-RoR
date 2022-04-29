class Admin::BookfinesController < ApplicationController
    def index
        @book_fines = BookFine.page params[:page]
    end
end
