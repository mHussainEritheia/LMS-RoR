class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.integer :rating

      t.timestamps
    end
    add_reference :ratings, :user
    add_reference :ratings, :book
  end
end
