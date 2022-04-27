class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.datetime :publication_year
      t.boolean :availble

      t.timestamps
    end
  end
end
