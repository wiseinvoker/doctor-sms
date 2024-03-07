class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  after_create :enqueue_appointment_notification_job

  private

  def enqueue_appointment_notification_job
    SendSmsNotificationJob.perform_later(patient.phone_number, "Your appointment with Dr. #{doctor.full_name} has been booked.")
  end
end
