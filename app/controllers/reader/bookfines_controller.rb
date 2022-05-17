class Reader::BookfinesController < ApplicationController
    def index
        @book_fines = BookFine.dues(current_user.id).page params[:page]
    end
end