class Topic <ActiveRecord::Base
  has_many :articles, -> { desc(:created_at) }, :dependent => :destroy, class_name: 'Article'
end