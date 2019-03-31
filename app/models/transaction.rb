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
    "Transação de #{month.capitalize}-#{year}"
  end

  # All transactions from a given user
  def self.from_user(user)
    where(user: user)
  end

  # Returns the index of the month we are currently creating Transaction instances
  def self.current_month_index
    (Time.now.utc.to_date.month - 1) % 12
  end

  # Returns the year that we are currently creating Transaction instances
  def self.current_year
    current_month_index == 11 ? Time.now.utc.to_date.year - 1 : Time.now.utc.to_date.year
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
