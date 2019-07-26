# frozen_string_literal: true

class UserAbility
  include CanCan::Ability

  def initialize(user) # rubocop:disable Metrics/CyclomaticComplexity
    can :manage, User if user&.admin?
    can :manage, User if user&.president? # President can manage anything

    # Can create and read users if it is on direction
    can %i[create read], User if user&.on_direction?

    # Can index and create transactions if it is a high stake
    can %i[index_transaction create_transaction], User if user&.admin? ||
                                                          user&.president? ||
                                                          user&.treasurer?

    # Can see user documents if it is on direction, is admin or is the proper user
    can :see_documents, User if user&.admin? || user &.on_direction?
    can :see_documents, User, id: user&.id

    # Every user can see and edit itself
    can :show, User, id: user&.id
    can :edit, User, id: user&.id
  end
end
