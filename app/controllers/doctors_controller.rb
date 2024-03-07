class DoctorsController < ApplicationController
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(patient_params)
    if @doctor.save
      # Trigger SMS notification for new sign-up
      # SendSmsNotificationJob.perform_later(@doctor.phone_number, "Welcome to our clinic! You have successfully signed up.")
      redirect_to root_path, notice: 'Doctor was successfully registered.'
    else
      render :new
    end
  end

  def index
    @doctors = Doctor.all.includes(:availabilities)
    render :index
  end
end
