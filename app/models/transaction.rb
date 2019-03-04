# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user

  validates :month, presence: true
  validates :year, presence: true,
                   numericality: { only_integer: true, greater_than_or_equal_to: 2019 }
  validates :not_duplicated

  MONTH_LIST = %w[january february march april may june
                  july august september october november december].each(&:freeze)

  enum month: MONTH_LIST.each_with_index.to_h { |month, idx| [month, idx + 1] }

  private

  # rubocop:disable Style/GuardClause
  def not_duplicated
    unless Transaction.where(user: user, month: month, year: year).length.zero?
      errors.add(:user, 'já possui uma transação nesse mês e ano')
    end
  end
  # rubocop:enable all
end
