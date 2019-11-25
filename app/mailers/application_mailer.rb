# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'backendrailsmailer@gmail.com'
  layout 'mailer'
end
