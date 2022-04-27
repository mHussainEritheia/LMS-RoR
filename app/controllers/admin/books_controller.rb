class Admin::BooksController < ApplicationController
   #  before_action :set_category
    def index
      # binding.pry
         if user_session.nil?
            redirect_to new_user_session_path
            else
               @books = Book.all
         end
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.create(book_param)
        if @book
         redirect_to admin_books_path
        else
         render action: "new"
        end
    end

    def edit
        @book = Book.find(params[:id])
     end

     def update
        @book = Book.find(params[:id])      
        if @book.update(book_param)
           redirect_to :action => 'show'
        else
           render :action => 'edit'
        end
     end

     def destroy
         if Book.find(params[:id]).destroy
            # redirect_to :action => 'index'
            redirect_to admin_books_path, status: :see_other
         else
            render "index"
         end
     end

     private
     def set_category
        @category = BookCategory.find(params[:book_category_id])
     end

    def book_param
        params.require(:book).permit(:name, :author, :publication_year, :book_category_id)
     end
end
