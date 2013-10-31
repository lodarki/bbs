class AddRightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :right, :integer, null: false, :default => 1
  end
end
