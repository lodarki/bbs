class ChangeTypeToUsers < ActiveRecord::Migration
  def change
    change_column :users, :type, :string, :null => false, :default => "NormalUser"
  end
end
