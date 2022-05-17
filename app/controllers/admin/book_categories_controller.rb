class Admin::BookCategoriesController < ApplicationController
   before_action :set_category_id, only: [:update, :destroy, :edit]
   def index
     @q = BookCategory.ransack(params[:q])
     @categories = @q.result.page params[:page]
     authorize ([:admin, @categories])
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
      authorize ([:admin, @category])
    end
    def update
      if @category.update(category_param)
         authorize ([:admin, @category])
         redirect_to :action => 'index'
      else
         render :action => 'edit'
      end
   end
   def destroy
      authorize ([:admin, @category])
      if @category.destroy
         redirect_to :action => 'index'
      else
         render :action => 'index'
      end
   end
   private
   def category_param
      params.require(:book_category).permit(:name)
   end
   def set_category_id
      @category = BookCategory.category_find(params[:id])
   end
end