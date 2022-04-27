class AddRefrencesToRequestedbook < ActiveRecord::Migration[7.0]
  def change
    add_reference :requested_books, :user, foreign_key: true
    add_reference :requested_books, :book, foreign_key: true
  end
end
