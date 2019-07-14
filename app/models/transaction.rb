# frozen_string_literal: true

class Transaction < ApplicationRecord
  include EnumI18nHelper

  belongs_to :user
  has_many :user_tickets, dependent: :restrict_with_error

  validates :month, presence: true
  validates :year, presence: true,
                   numericality: { only_integer: true, greater_than_or_equal_to: 2019 }
  validate :not_duplicated

  MONTH_LIST = %w[january february march april may june
                  july august september october november december].each(&:freeze)

  enum month: MONTH_LIST.each_with_index.to_h { |month, idx| [month, idx + 1] }
  enum status: { open: 0, finish: 1, close: 2 }

  # Returns a beautified string for the Transaction breadcrumb
  def breadcrumb
    "Transação de #{enum_t(self, :month)}-#{year}"
  end

  # Returns a string containing the type of badge, according to the Transaction status
  def badge_for_status
    case status.to_sym
    when :open
      'warning'
    when :finish
      'primary'
    when :close
      'success'
    end
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
    same_transactions = Transaction.where(user: user, month: month, year: year)

    unless same_transactions.count.zero? || same_transactions.first == self
      errors.add(:user, 'já possui uma transação nesse mês e ano')
    end
  end
  # rubocop:enable all
end
