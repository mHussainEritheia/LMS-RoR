class Reader::BookCategoriesController < ApplicationController
    def index
        @categories = BookCategory.all
    end
end 