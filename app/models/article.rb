class Article < ActiveRecord::Base
  has_many :comments, :order => 'created_at DESC', :dependent => :destroy
  belongs_to :topic
  belongs_to :user

  def format_detail
  	self.detail.to_s.gsub!("\n", "<br/>")
  	ap detail
  end
end