class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def like_check(article_id)
    return !self.like_list.to_s.include?("St#{article_id}Ed") if self.like_list
    return true
  end

  def like_remember(article_id)
    self.like_list ||= ""
    self.like_list += "St#{article_id}Ed"
    self.save
  end
end