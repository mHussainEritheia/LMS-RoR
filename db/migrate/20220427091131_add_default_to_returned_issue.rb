class AddDefaultToReturnedIssue < ActiveRecord::Migration[7.1]
  def change
    change_column :issue_books, :returned, :boolean, default: false
  end
end
