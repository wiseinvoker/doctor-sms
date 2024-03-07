# app/controllers/availabilities_controller.rb
class AvailabilitiesController < ApplicationController
    before_action :authenticate_doctor!
  
    def new
      @availability = current_doctor.availabilities.new
    end
  
    def create
      @availability = current_doctor.availabilities.build(availability_params)
      @availability.status = :available
      if @availability.save
        redirect_to root_path, notice: 'Availability set successfully.'
      else
        render :new
      end
    end
  
    private
  
    def availability_params
      params.require(:availability).permit(:day_of_week, :start_time, :end_time)
    end
  end
  