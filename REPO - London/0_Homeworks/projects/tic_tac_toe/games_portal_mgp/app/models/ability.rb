class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.try(:persisted?)
      can :read, Game
      can :create, Game
      can :make_move, Game do |game|
        game.includes_player?(user)
      end
    else
      can :create, User
      can :read, User, id: user.id      
    end

  end
end
