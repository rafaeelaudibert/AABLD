class BusCompanyAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, BusCompany if user.admin?
    can :manage, BusCompany if user.president?
    can :see, BusCompany if user.on_direction?
  end
end
