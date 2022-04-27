class Reader::RequestedBooksController < ApplicationController
  def index
  end

  def show

  end

  def requestBook
    
  end

  def new
    @book_id = params[:book_id]
    @category = params[:book_category_id]
    @newRequest = current_user.requested_books.new
    binding.pry
  end
end
