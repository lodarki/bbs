class RenameTableArticleCommonts < ActiveRecord::Migration
  def change
    rename_table("article_comments", "comments")
  end
end
