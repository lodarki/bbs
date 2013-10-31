class CreateForNumArticles < ActiveRecord::Migration
  def change
    create_table :for_num_articles do |t|
      t.integer    :for_num_name_id, :null => false
      t.string     :title,           :null => false, :default => "Blank Theme"
      t.text       :detail
      t.integer    :user_id,         :null => false
      t.integer    :permission,      :null => false, :default => 0
      t.timestamps
      t.references :for_num_name ,   :index => true
      t.references :user,            :index => true
    end
  end
end
