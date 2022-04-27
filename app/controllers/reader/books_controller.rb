class Reader::BooksController < ApplicationController
    # before_action :setCategory
    def index
        @books = @category.books.all
    end

    def show
        @book = @category.books.find(params[:id])
    end

    private
    def setCategory
        # @category = BookCategory.find(params[:book_category_id])
    end
end
