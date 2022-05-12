class Admin::BooksController < ApplicationController
   
    def index
      @q = Book.ransack(params[:q])
         if user_session.nil?
            redirect_to new_user_session_path
            else
              if params[:availble] === "true"
               @books = Book.where(availble: true).page params[:page]
              elsif params[:availble] === "false"
               @books = Book.where(availble: false).page params[:page]
              else
               @books = @q.result.includes(:book_category).page params[:page]
              end
      authorize ([:admin, @books]) 
         end
    end  

    def show
        @book = Book.find(params[:id])
        authorize ([:admin, @book])
    end

    def new
        @book = Book.new
        authorize ([:admin, @book])
    end

    def create
      @book = Book.new(book_param)
      # debugger
      if @book.save
         redirect_to admin_books_path
      else
         render 'new'
      end
    end

    def edit
        @book = Book.find(params[:id])
        authorize ([:admin, @book])
     end

     def update
        @book = Book.find(params[:id])      
        if @book.update(book_param)
         redirect_to admin_books_path
        else
           render :action => 'edit'
        end
      authorize ([:admin, @book])
     end

     def destroy
      # debugger
         if Book.where(id: params[:id]).first.destroy
            redirect_to admin_books_path, status: :see_other
         else
            render "index"
         end
     end

    def book_param
        params.require(:book).permit(:name, :author, :publication_year, :book_category_id, :image)
     end
end
