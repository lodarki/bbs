class ForNumName <ActiveRecord::Base
  has_many :for_num_articles, :order => 'created_at DESC', :dependent => :destroy
end