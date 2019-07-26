# frozen_string_literal: true

class DirectionAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, :direction if user.admin? || user.president?
    can :show, :direction
  end
end
