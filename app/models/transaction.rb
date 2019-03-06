# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user
  has_many :user_tickets

  validates :month, presence: true
  validates :year, presence: true,
                   numericality: { only_integer: true, greater_than_or_equal_to: 2019 }
  validate :not_duplicated

  MONTH_LIST = %w[january february march april may june
                  july august september october november december].each(&:freeze)

  enum month: MONTH_LIST.each_with_index.to_h { |month, idx| [month, idx + 1] }
  enum status: { open: 0, closed: 1 }

  def breadcrumb
    "#{user.name} @ #{month.capitalize}-#{year}"
  end

  private

  # rubocop:disable Style/GuardClause
  def not_duplicated
    unless Transaction.where(user: user, month: month, year: year).length.zero?
      errors.add(:user, 'já possui uma transação nesse mês e ano')
    end
  end
  # rubocop:enable all
end
