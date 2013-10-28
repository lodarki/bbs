class AddRightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :right, :int, null: false, :default => 1 
  end
end
