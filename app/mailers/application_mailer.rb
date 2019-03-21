# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'apoio.piubs@gmail.com'
  layout 'mailer'
end
