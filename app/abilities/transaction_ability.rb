# frozen_string_literal: true

class TransactionAbility
  include CanCan::Ability

  def initialize(user)
    can :manage, Transaction if user.admin?
    can :manage, Transaction if user.treasurer? # Treasurer can do anything with the transactions

    # Treasurer cannot open already closed Transaction
    cannot :open, Transaction, status: :close if user.treasurer?

    # President can see all transactions
    can :read, Transaction if user.president?

    can :read, Transaction, user_id: user.id  # Own transactions
  end
end
