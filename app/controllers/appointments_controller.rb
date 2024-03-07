# app/controllers/appointments_controller.rb
class AppointmentsController < ApplicationController
  def index
    @availabilities = Availability.where(status: :available)
  end

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @availability = @doctor.availabilities.find(params[:availability_id])
    @appointment = Appointment.new(doctor: @doctor, start_time: @availability.start_time, end_time: @availability.end_time, patient: current_patient)
  end

  def create
    availability = Availability.find_by(id: params[:availability_id])
    patient = current_patient

    if availability.available?
      # Update availability record to mark it as booked
      availability.update(status: :booked)

      # Create appointment record
      appointment = Appointment.create(
        availability_id: availability.id,
        doctor_id: availability.doctor_id,
        patient_id: patient.id,
        start_time: availability.start_time,
        end_time: availability.end_time
      )

      if appointment.persisted?
        # Appointment created successfully
        redirect_to appointment_path(appointment), notice: 'Appointment booked successfully.'
      else
        # Appointment creation failed
        redirect_to root_path, alert: 'Failed to book appointment.'
      end
    else
      # Availability slot is already booked or unavailable
      redirect_to root_path, alert: 'Appointment slot is not available.'
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :doctor_id, :patient_id)
  end
end
  