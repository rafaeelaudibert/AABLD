# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :confirmable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable, :async

  has_many :transactions
  has_many :user_tickets
  belongs_to :responsible, optional: true, class_name: 'User'
  belongs_to :university

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

  # Returns the User instance full name, concatenating <tt>first_name</tt> and <tt>last_name</tt>
  def full_name
    "#{first_name} #{last_name}"
  end

  # Returns true, if the user is a Ticket Responsible
  def ticket_responsible?
    ticket_reponsible == true
  end

  # Users which are ticket responsibles
  def self.ticket_responsibles
    where(ticket_responsible: true)
  end
end
