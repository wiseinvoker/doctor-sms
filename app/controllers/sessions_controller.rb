# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
    def new
    end
  
    def create
      patient = Patient.find_by(phone_number: params[:phone_number])
      if patient
        session[:patient_id] = patient.id
        redirect_to root_path, notice: "You have successfully logged in!"
      else
        flash.now[:alert] = "Invalid phone number"
        render :new
      end
    end
  
    def destroy
      session[:patient_id] = nil
      redirect_to root_path, notice: "You have been logged out"
    end
  end
  