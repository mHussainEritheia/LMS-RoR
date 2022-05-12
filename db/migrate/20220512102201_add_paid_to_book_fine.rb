class AddPaidToBookFine < ActiveRecord::Migration[7.1]
  def change
    add_column :book_fines, :paid, :boolean
  end
end
