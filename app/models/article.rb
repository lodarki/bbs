class Article < ActiveRecord::Base
  has_many :article_comments, :order => 'created_at DESC', :dependent => :destroy
  belongs_to :topic
  belongs_to :user
end