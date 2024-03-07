# app/jobs/send_sms_notification_job.rb
class SendSmsNotificationJob < ApplicationJob
  queue_as :default
  
  def perform(phone_number, message)
    SmsService.new.send_sms(phone_number, message)
  end
end
  