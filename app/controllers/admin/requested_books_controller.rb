class Admin::RequestedBooksController < ApplicationController
    before_action :set_id, only: [:update]
    def index
        if params[:status] === "pending"
            @req_all = RequestedBook.status_pending.page params[:page]
        elsif params[:status] === "approved"
            @req_all = RequestedBook.status_approved.page params[:page]
        elsif params[:status] === "rejected"
            @req_all = RequestedBook.status_rejected.page params[:page]
        else
            @req_all = RequestedBook.page params[:page]
        end
    end
    def update
        if params[:status] === "approved"
            IssueBook.create(return_date: Time.new.to_date + 50.days, book_id: params[:book_id], user_id: @reqBook.user_id) && @reqBook.update(status: params[:status], approved_date: Time.now) && Book.find(@reqBook.book_id).update(availble: false)
            IssueBookMailer.with(book: @reqBook).book_approval.deliver_now
            redirect_to admin_requested_books_path
        else
            @reqBook.update(status: params[:status])
            IssueBookMailer.with(book: @reqBook).book_approval.deliver_now
            redirect_to admin_requested_books_path
        end
    end
    def set_id
        @reqBook = RequestedBook.find(params[:id])
    end
end 