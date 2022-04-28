class Admin::RequestedBooksController < ApplicationController
    def index
        @req_all = RequestedBook.all
    end

    def edit
        # debugger
        @reqBook = RequestedBook.find(params[:id])
    end

    def admin_rejected_book
        # debugger
        if RequestedBook.find(params[:id]).update(status: params[:status])       
            redirect_to admin_requested_books_path
        else
            render :index
        end
    end

    def update
        # debugger
        @reqBook = RequestedBook.find(params[:id])
        if params[:status] === "approved"
            IssueBook.create(return_date: Time.new.to_date + 50.days, book_id: params[:book_id], user_id: @reqBook.user_id) && @reqBook.update(status: params[:status], approved_date: Time.now) && Book.find(@reqBook.book_id).update(availble: false)
            redirect_to admin_requested_books_path
        else
            @reqBook.update(status: params[:status])
            # debugger
            redirect_to admin_requested_books_path
        end
    end
end
