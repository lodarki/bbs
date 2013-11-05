class AddLikeListToUsers < ActiveRecord::Migration
  def change
    add_column :users, :like_list, :text
  end
end
