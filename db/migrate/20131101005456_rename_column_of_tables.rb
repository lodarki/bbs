class RenameColumnOfTables < ActiveRecord::Migration
  def change
    rename_column(:article_comments, :for_num_article_id, :article_id)
    rename_column(:articles, :for_num_name_id, :topic_id)
  end
end
