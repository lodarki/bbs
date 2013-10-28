class CreateForNumNames < ActiveRecord::Migration
  def change
    create_table :for_num_names do |t|
      t.string :name
    end
  end
end