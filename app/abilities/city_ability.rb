class CityAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, City if user.admin?
    can :read, City if user.on_direction?
  end
end
