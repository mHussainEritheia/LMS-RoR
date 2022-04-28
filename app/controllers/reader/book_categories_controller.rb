class Reader::BookCategoriesController < ApplicationController
    def index
        @categories = BookCategory.all
    end

    def show
        @category = BookCategory.find(params[:id])
    end
end
 