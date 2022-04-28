class Admin::IssuebooksController < ApplicationController
    def index
        @issued_books = IssueBook.all
    end
end