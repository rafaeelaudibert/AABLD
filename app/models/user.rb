# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :confirmable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable

  has_many :transactions
  belongs_to :ticket_responsible, optional: true, class_name: 'User'
  belongs_to :university

  validates :name, presence: true
  validates :rg, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validates_cpf_format_of :cpf, options: { allow_blank: true, allow_nil: true }
  validates :mother_name, presence: true
  validates :birthdate, presence: true
  validates :bank_account, presence: true
  validates :bank_agency, presence: true
  validates :course, presence: true
  validates :semester, presence: true
  validates :semester_start, presence: true
  validates :semester_end, presence: true

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
end
