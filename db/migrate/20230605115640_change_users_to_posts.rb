class ChangeUsersToPosts < ActiveRecord::Migration[7.0]
  def change
    rename_table :users, :posts
  end
end
