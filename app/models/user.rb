# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :confirmable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable

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
  enum role: %i[admin president treasurer secretary vice_president vice_treasurer vice_secretary staff member]
end
