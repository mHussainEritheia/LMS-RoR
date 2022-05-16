class Admin::RequestedBooksController < ApplicationController
    def index
        if params[:status] === "pending"
            @req_all = RequestedBook.where(status: "pending").page params[:page]
        elsif params[:status] === "approved"
            @req_all = RequestedBook.where(status: "approved").page params[:page]
        elsif params[:status] === "rejected"
            @req_all = RequestedBook.where(status: "rejected").page params[:page]
        else
            @req_all = RequestedBook.page params[:page]
        end
    end
    def update
        @reqBook = RequestedBook.find(params[:id])
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
end