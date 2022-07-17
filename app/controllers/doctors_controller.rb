class DoctorsController < ApplicationController
  def show
    @active_patients = current_user.appointments.includes(:patient).active
  end
end
