class Reader::BookfinesController < ApplicationController
    def index
        @book_fines = BookFine.where(user_id: current_user.id).page params[:page]
    end
    def pay_dues
        BookFine.update(paid: true)
        redirect_to reader_bookfines_path
    end
end