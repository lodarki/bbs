class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :type, :right

  def is_admin?
    false
  end

  def is_normal_user?
    false
  end

  def is_vip_user?
    false
  end

  require_dependency 'admin'
  require_dependency 'normal_user'
  require_dependency 'vip_user'
end
