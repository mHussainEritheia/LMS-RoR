class CreateBookFines < ActiveRecord::Migration[7.0]
  def change
    create_table :book_fines do |t|
      t.float :amount
      t.integer :user_id
      t.integer :book_id
      t.timestamps
    end
  end
end
