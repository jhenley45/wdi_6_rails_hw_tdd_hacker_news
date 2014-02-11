class RemoveUsernameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :username, :text
  end
end
