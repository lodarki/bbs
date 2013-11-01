class ChangeTypeSecondToUsers < ActiveRecord::Migration
  def change
    change_column :users, :type, :string, :null => false, :default => "User"
  end
end
