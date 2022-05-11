class Admin::BookCategoriesController < ApplicationController
    def index
      @q = BookCategory.ransack(params[:q])
      @categories = @q.result.page params[:page]
      authorize ([:admin, @categories])
    end

    def show
        @category = BookCategory.find(params[:id])
        authorize ([:admin, @category])
    end

    def new
        @category = BookCategory.new
    end

    def create
        @category = BookCategory.new(category_param)
        if @category.save
         authorize ([:admin, @category])
         redirect_to :action =>  'index'
        else
         render 'new'
        end
    end

    def edit
        @category = BookCategory.find(params[:id])
        authorize ([:admin, @category])
     end

     def update
        @category = BookCategory.find(params[:id])      
        if @category.update(category_param)
         authorize ([:admin, @category])
           redirect_to :action => 'show'
        else
           render :action => 'edit'
        end
     end

     def destroy
        @category = BookCategory.find(params[:id])
        # debugger
        authorize ([:admin, @category])
         if @category.destroy
            redirect_to :action => 'index'
         else
            render :action => 'index'
         end
     end

    def category_param
        params.require(:book_category).permit(:name)
     end
end
