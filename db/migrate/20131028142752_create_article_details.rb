class CreateArticleDetails < ActiveRecord::Migration
  def change
    create_table   :article_details do |t|
      t.integer    :for_num_article_id
      t.text       :detail
      t.integer    :user_id
      t.timestamps
      t.references :for_num_article , :index => true
      t.references :user, :index => true
    end
  end
end
