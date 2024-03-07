# app/services/sms_service.rb
class SmsService < ApplicationJob
  queue_as :default
  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end
  
  def send_sms(to, body)
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: to,
      body: body
    )
  end

  def perform(to, body)
    # Code to send SMS notification
  end
end
