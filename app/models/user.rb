class User < ActiveRecord::Base
  has_many :todos
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :downcase_email 

  def downcase_email
    self.email = email.downcase
  end

 
end