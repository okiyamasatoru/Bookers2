class RemoveTextFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :text, :string
  end
end
