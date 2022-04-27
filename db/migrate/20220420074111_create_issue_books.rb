class CreateIssueBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :issue_books do |t|
      t.string :name
      t.datetime :return_date
      t.datetime :actual_return_date
      t.boolean :returned
      t.timestamps
    end
  end
end
