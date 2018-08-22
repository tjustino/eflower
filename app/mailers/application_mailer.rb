# frozen_string_literal: true

# Setup to generate email message
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end
