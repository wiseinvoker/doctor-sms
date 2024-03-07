class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :appointments

    after_create :enqueue_signup_notification_job

    private

    def enqueue_signup_notification_job
        SendSmsNotificationJob.perform_later(phone_number, "Welcome to our clinic! You have successfully signed up.")
    end
end
