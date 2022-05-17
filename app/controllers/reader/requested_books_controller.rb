class Reader::RequestedBooksController < ApplicationController
  def index
    @requestedBooks = RequestedBook.user_req_books(current_user.id).page params[:page]
  end
  def book_rating
    if Rating.create(user_id: current_user.id, book_id: session[:book_id], rating: params[:rating])
    redirect_to reader_books_path
    end
  end
  def return_book
    penalty = 0
    days_def = 0
    @reqBook = RequestedBook.find(params[:id])
    @book_id = @reqBook.book_id
    @user_id = @reqBook.user_id
    Book.find(@book_id).update(availble: true)
    @issueInstance = IssueBook.where(book_id: @book_id).first
    @issueInstance.update(returned: true, actual_return_date: Time.now.to_date + 65.days)
    if @issueInstance.actual_return_date.to_date > @issueInstance.return_date.to_date
      days_def = (@issueInstance.actual_return_date.to_date - @issueInstance.return_date.to_date).to_i
      penalty = days_def * 110
      BookFine.create(paid: false,amount: penalty, user_id: @user_id, book_id: @book_id, issue_book_id: @issueInstance.id)
      session[:book_id] = @book_id
    end 
  end
  def new
    @book = Book.find(params[:format])
    @category_id = @book.book_category_id
    @category = BookCategory.find(@book.book_category_id)
    @user_id = current_user.id
    if @request = RequestedBook.new(user_id: @user_id, book_id: @book.id)
      @request.save
      redirect_to reader_books_path
    else
      redirect_to reader_book_path(@book.id)
    end
  end
  private
  def request_param
    params.require(:requested_book).permit(:user_id, :book_id, :created_at)
  end
end