class CreateRequestedBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :requested_books do |t|
      t.integer :status
      t.datetime :approved_date

      t.timestamps
    end
  end
end
