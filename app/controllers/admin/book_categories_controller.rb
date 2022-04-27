class Admin::BookCategoriesController < ApplicationController
    def index
        @categories = BookCategory.all
    end

    def show
        @category = BookCategory.find(params[:id])
    end

    def new
        @category = BookCategory.new
    end

    def create
        if @category = BookCategory.create(category_param)
         redirect_to :action =>  'index'
        else
         render 'new'
        end
    end

    def edit
        @category = BookCategory.find(params[:id])
     end

     def update
        @category = BookCategory.find(params[:id])      
        if @category.update(category_param)
           redirect_to :action => 'show'
        else
           render :action => 'edit'
        end
     end

     def destroy
        @book = BookCategory.find(params[:id])
        # debugger
         if @book.destroy
            redirect_to :action => 'index'
         else
            render :action => 'index'
         end
     end

    def category_param
        params.require(:book_category).permit(:name)
     end
end
