class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :topic
  belongs_to :user

  def like_by(user)
    if user
      user.like_remember(self.id)
      self.update(like: self.like+1)
    end
  end
end