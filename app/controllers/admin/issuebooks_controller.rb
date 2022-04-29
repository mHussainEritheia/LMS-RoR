class Admin::IssuebooksController < ApplicationController
    def index
        # debugger
       if params[:returned] === "true"
        @issued_books = IssueBook.where(returned: true).page params[:page]
       elsif params[:returned] === "false"
        @issued_books = IssueBook.where(returned: false).page params[:page]
       else
        @issued_books = IssueBook.page params[:page]
       end
    end
end