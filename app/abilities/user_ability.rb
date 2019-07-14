# frozen_string_literal: true

class UserAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, User if user.admin?
    can :manage, User if user.president?    # President can manage anything
    can :show, User, id: user.id            # Can see and itself
    can :create, User if user.on_direction? # Can create users if it is on direction
    can :read, User if user.on_direction?   # Can read any user if it is on direction
  end
end
