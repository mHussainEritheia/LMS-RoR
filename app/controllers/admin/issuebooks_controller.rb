class Admin::IssuebooksController < ApplicationController
    def index
        if params[:returned] === "true"
            @issued_books = IssueBook.returned_true.page params[:page]
        elsif params[:returned] === "false"
            @issued_books = IssueBook.returned_false.page params[:page]
        else
            @issued_books = IssueBook.page params[:page]
        end
    end
end 