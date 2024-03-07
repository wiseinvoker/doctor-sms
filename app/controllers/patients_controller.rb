# app/controllers/patients_controller.rb
class PatientsController < ApplicationController
    before_action :authenticate_patient!, except: [:new, :create]
  
    def new
      @patient = Patient.new
    end
  
    def create
      @patient = Patient.new(patient_params)
      if @patient.save
        # Trigger SMS notification for new sign-up
        SendSmsNotificationJob.perform_later(@patient.phone_number, "Welcome to our clinic! You have successfully signed up.")
        redirect_to root_path, notice: 'Patient was successfully created.'
      else
        render :new
      end
    end
  
    def index
      @doctors = Doctor.all.includes(:availabilities)
      render :index
    end
  
    def book_appointment
      @doctor = Doctor.find(params[:doctor_id])
      @availability = @doctor.availabilities.find(params[:availability_id])
      @appointment = Appointment.new(doctor: @doctor, start_time: @availability.start_time, end_time: @availability.end_time, patient: current_patient)
      if @appointment.save
        # Trigger SMS notification for appointment booking
        SendSmsNotificationJob.perform_later(current_patient.phone_number, "Your appointment with Dr. #{@appointment.doctor.full_name} has been booked.")
        @availability.update(status: :booked)
        redirect_to root_path, notice: 'Appointment was successfully booked.'
      else
        redirect_to root_path, alert: 'Failed to book appointment.'
      end
    end
  
    private
  
    def patient_params
      params.require(:patient).permit(:full_name, :phone_number, :email, :password, :password_confirmation)
    end
  end
  