class InsertRecordsIntoForNumNames < ActiveRecord::Migration
  def up
  	execute <<-SQL
  	  INSERT INTO for_num_names (name) values ("News"), ("Pictures"), ("Novels"), ("Music"), ("Films")
  	SQL
  end

  def down
  	ForNumName.delete_all
  end
end
