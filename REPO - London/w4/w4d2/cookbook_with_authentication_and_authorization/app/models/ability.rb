class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all

    elsif user.role? :user
      can :manage, :all
      cannot [:create, :destroy], User

    else
      can :read, :all
      can :create, User
    end
  end
end
