class UniversityAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, University if user.admin? 
    can :manage, University if user.president?
    can :read, University if user.on_direction?
  end
end
