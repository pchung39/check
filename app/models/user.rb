class User < ActiveRecord::Base
  rolify
  has_many :todos
  has_many :user_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :downcase_email

  ROLES= %w[ Admin User ]

  def to_param
    name
  end

  def downcase_email
    self.email = email.downcase
  end

  def admin?
    self.has_role? :admin
  end
end