class Reader::BooksController < ApplicationController
    def index
        @books = Book.all
        authorize [:reader, @books]
        # debugger
    end

    def show
        @book = Book.find(params[:id])
    end
end
