class RemoveIssueField < ActiveRecord::Migration[7.1]
  def change
    remove_column :issue_books, :name, :string
  end
end
