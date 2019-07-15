# frozen_string_literal: true

class SidebarAbility
  include CanCan::Ability

  def initialize(user)
    # Admin can manage anything
    can :manage, :all if user.admin?

    # Everybody can access Dashboard panel
    can :access, :dashboard

    # Configure General tab
    can_general user

    # Configure Administrative panel
    can_administrative user
  end

  private

  def can_general(user)
    # Everybody can access Transactions panel
    can :access, :transactions

    # Admins and Direction can access Users panel
    can :access, :users if user.on_direction?
  end

  def can_administrative(user)
    # Everybody can access Tickets panel
    can :access, :tickets

    # Admins and Direction can access BusCompanies panel
    can :access, :bus_companies if user.on_direction?

    # Admins and Direction can access Cities panel
    can :access, :cities if user.on_direction?

    # Admins and Direction can access Universities panel
    can :access, :universities if user.on_direction?
  end
end
