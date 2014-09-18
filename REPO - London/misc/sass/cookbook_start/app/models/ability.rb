class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
      if user.role?(:author)
        can :create, Recipe
        can :update, Recipe do |recipe|
          recipe.user == user
        end
        can :destroy, Recipe do |recipe|
          recipe.user == user
        end
        can :manage, Quantity, :recipe => { :user_id => user.id }
      end
    end
  end
end
