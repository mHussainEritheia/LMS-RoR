class IssueBookMailer < ApplicationMailer
    def book_approval
        @book = params[:book]
        # debugger
        mail(to: 'minhasm69@gmail.com', subject: 'Your book has been approved')
    end
end
