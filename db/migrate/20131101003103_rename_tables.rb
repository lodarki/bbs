class RenameTables < ActiveRecord::Migration
  def change
    rename_table("article_details", "article_comments")
    rename_table("for_num_articles", "articles")
    rename_table("for_num_names", "topics")
  end
end
