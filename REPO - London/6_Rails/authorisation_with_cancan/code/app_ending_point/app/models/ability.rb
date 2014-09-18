class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :manage, :all
    else
      can :index, User
      can :manage, User do |user_to_check|
        user_to_check == user
      end
      can :read, :secret if user.persisted?
    end

  end
end
