class Reader::TopRatedBooksController < ApplicationController
  def index
    @decBooks = Book.joins(:ratings).select("books.id, avg(ratings.rating) as average_rating, count(ratings.id) as number_of_reviews").group("books.id").order("average_rating DESC, number_of_reviews DESC").page params[:page]
  end
end