class AddCustomFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
      add_column :users, :name, :string
      add_column :users, :gender, :string
      add_column :users, :address, :string
      add_column :users, :mobile, :bigint
      add_reference :users, :role, foreign_key: true
  end
end
