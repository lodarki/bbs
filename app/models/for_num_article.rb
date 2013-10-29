class ForNumArticle < ActiveRecord::Base
  has_many :article_details, :order => 'created_at DESC', :dependent => :destroy
  belongs_to :for_num_name
  belongs_to :user
end