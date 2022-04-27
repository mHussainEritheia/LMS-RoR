class RemoveAvailbleColumnBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :availble
    add_column :books, :availble, :boolean, default: true
  end
end
