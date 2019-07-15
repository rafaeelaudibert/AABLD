# frozen_string_literal: true

require 'letter_avatar/has_avatar'

class User < ApplicationRecord
  include LetterAvatar::HasAvatar
  include EnumI18nHelper

  # Include default devise modules. Others available are:
  # :lockable, :confirmable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable, :async

  has_many :transactions, dependent: :restrict_with_error
  has_many :user_tickets, dependent: :restrict_with_error
  belongs_to :responsible, optional: true, class_name: 'User'
  belongs_to :university
  has_one :city, through: :university

  after_save :validate_responsible

  validates :first_name, presence: true
  validates :rg, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validates_cpf_format_of :cpf, options: { allow_blank: true, allow_nil: true }
  validates :mother_name, presence: true
  validates :birthdate, presence: true
  validates :bank_account, presence: true
  validates :bank_agency, presence: true
  validates :course, presence: true
  validates :semester, presence: true

  enum bank_option: %i[checking savings]
  enum role: {
    member: 0,
    president: 1,
    treasurer: 2,
    secretary: 3,
    vice_president: 4,
    vice_treasurer: 5,
    vice_secretary: 6,
    staff: 7,
    admin: 8
  }

  # Scopes
  scope :not_admin, -> { where.not(role: :admin) }

  # Returns the User instance full name, concatenating <tt>first_name</tt> and <tt>last_name</tt>
  def full_name
    "#{first_name} #{last_name}"
  end
  alias name full_name # Used by LetterAvatar

  # Return a string with the User parent names
  def parents
    "#{mother_name} #{"e #{father_name}" unless father_name.nil?}"
  end

  # Return a string with the User parsed bank information
  def bank_information
    "Ag. #{bank_agency} | Conta: #{bank_account} | #{enum_t(self, :bank_option)}"
  end

  # Returns the user age
  def age # rubocop:disable Metrics/AbcSize
    now = Time.now.utc.to_date
    gone = now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)
    now.year - birthdate.year - (!gone ? 1 : 0)
  end

  # Returns true if there already exists a Transaction created in this month for the User
  def did_monthly_transaction?
    transactions.last&.month_before_type_cast == Transaction.current_month_index
  end

  # Returns true, if the user is a Ticket Responsible
  def ticket_responsible?
    ticket_responsible == true
  end

  # Returns all the users which didn't made their Montly Transaction
  def self.not_did_monthly_transaction
    not_admin.reject(&:did_monthly_transaction?)
  end

  # Users which are ticket responsibles
  def self.ticket_responsibles
    where(ticket_responsible: true)
  end

  # Returns if the user belongs to the association direction
  def on_direction?
    president? || treasurer? || secretary? || vice_president? || vice_treasurer? || vice_secretary?
  end

  # Return all the cities which have users
  # This method uses uniq and compact unchained for performance reasons
  def self.all_cities
    all_cities = all.map(&:city)
    all_cities.uniq!
    all_cities.compact!
    all_cities
  end

  private

  # Update responsible foreign_key, if not present, to point to himself, as well
  # as mark itself as a ticket_responsible
  def validate_responsible
    update(responsible_id: id, ticket_responsible: true) if responsible_id.nil?
  end
end
