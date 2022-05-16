class Reader::BooksController < ApplicationController
    def index
        @books = Book.all.page params[:page]
        authorize [:reader, @books]
    end
    def show
        @book = Book.find(params[:id])
    end
end