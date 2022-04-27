class AddCategoryReferenceToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :book_category, foreign_key: true
  end
end
