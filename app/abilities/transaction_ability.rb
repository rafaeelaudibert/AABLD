class TransactionAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, Transaction if user.admin?
    can :manage, Transaction if user.treasurer?   # Treasurer can do anything with the transactions
    can :read, Transaction if user.president?     # President can see all transactions
    can :read, Transaction, user_id: user.id      # Own transactions
  end
end
