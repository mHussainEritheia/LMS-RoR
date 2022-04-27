class AddReferenceToFine < ActiveRecord::Migration[7.0]
  def change
    add_reference :book_fines, :issue_book, foreign_key: true
  end
end
