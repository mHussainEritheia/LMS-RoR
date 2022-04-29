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
               @books = @q.result.page params[:page]
              end
               # authorize ([:admin, @books])
         end
    end  

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
      if Book.create(book_param)
         redirect_to admin_books_path
      else
         render action: "new"
      end
    end

    def edit
        @book = Book.find(params[:id])
      #   debugger
        authorize @book
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
            redirect_to admin_books_path, status: :see_other
         else
            render "index"
         end
     end

    def book_param
        params.require(:book).permit(:name, :author, :publication_year, :book_category_id)
     end
end
