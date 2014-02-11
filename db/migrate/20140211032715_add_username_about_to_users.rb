class AddUsernameAboutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :text
    add_column :users, :about, :text
  end
end
