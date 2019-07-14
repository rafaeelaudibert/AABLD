class CityAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, City if user.admin?
    can :see, City if user.on_direction?
  end
end
