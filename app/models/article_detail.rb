class ArticleDetail < ActiveRecord::Base
  belongs_to :for_num_article
  belongs_to :user
end