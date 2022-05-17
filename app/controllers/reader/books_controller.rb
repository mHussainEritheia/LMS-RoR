class Reader::BooksController < ApplicationController
    def index
        @books = Book.all.page params[:page]
        authorize [:reader, @books]
    end
end