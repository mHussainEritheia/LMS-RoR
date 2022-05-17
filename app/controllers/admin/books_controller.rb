class Admin::BooksController < ApplicationController
   before_action :set_book_id, only: [:update, :edit, :destroy]
   def index
      @q = Book.ransack(params[:q])
      if user_session.nil?
         redirect_to new_user_session_path
      else
      if params[:availble] === "true" 
         @books = Book.book_true.page params[:page]
      elsif params[:availble] === "false"
         @books = Book.book_false.page params[:page]
      else
         @books = @q.result.includes(:book_category).page params[:page]
      end
         authorize ([:admin, @books]) 
      end
   end
   def new
      @book = Book.new
      authorize ([:admin, @book])
   end
   def create
      @book = Book.new(book_param)
      if @book.save
         redirect_to admin_books_path
      else
         render 'new'
      end
   end
   def edit
      authorize ([:admin, @book])
   end
   def update
      if @book.update(book_param)
         redirect_to admin_books_path
      else
         render :action => 'edit'
      end
      authorize ([:admin, @book])
   end
   def destroy
      if @book.destroy
         redirect_to admin_books_path, status: :see_other
      else
         render "index"
      end
   end
   private
   def book_param
      params.require(:book).permit(:name, :author, :publication_year, :book_category_id, :image)
   end
   def set_book_id
      @book = Book.book_find(params[:id])
   end
end