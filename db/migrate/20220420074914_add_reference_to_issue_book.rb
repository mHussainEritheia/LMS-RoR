class AddReferenceToIssueBook < ActiveRecord::Migration[7.0]
  def change
    add_reference :issue_books, :book, foreign_key: true
    add_reference :issue_books, :user, foreign_key: true
  end
end
