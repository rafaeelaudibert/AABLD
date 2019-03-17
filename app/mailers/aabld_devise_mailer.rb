# frozen_string_literal: true

class AabldDeviseMailer < Devise::Mailer
  default from: 'associacaoAABLD@gmail.com'

  def self.mailer_name
    'devise/mailer'
  end
end
