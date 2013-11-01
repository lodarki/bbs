class AddLikeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :like, :integer, :null => false, :default => 0
  end
end