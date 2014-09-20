class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    cannot :manage, :all
	if user.role :admin
	  can :manage, :all
	else
	  can :read, :all
	end
  end
end
