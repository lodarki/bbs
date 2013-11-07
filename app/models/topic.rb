class Topic <ActiveRecord::Base
  has_many :articles, -> { order('created_at DESC') } ,:dependent => :destroy, class_name: 'Article'
end