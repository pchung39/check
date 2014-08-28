class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :todoodoos, :dependent => :destroy
  has_many :roles, through: :user_roles

  ROLES = %w[admin user]
  serialize :roles

  def roles=(roles)
  self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
     ROLES.reject do |r|
       ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
  end
end
end
    



