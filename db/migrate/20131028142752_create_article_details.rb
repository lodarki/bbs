class CreateArticleDetails < ActiveRecord::Migration
  def change
    create_table :article_details do |t|
      t.int :for_num_article_id
      t.text :detail
      t.int :user_id
      t.timestamps
      t.references :for_num_article , :index => true
      t.references :user, :index => true
    end
  end
end
