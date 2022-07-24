class PatientsController < ApplicationController
  def show
    @inactive_appointment = current_user.
      appointments.includes([:doctor]).inactive

    @categories = Category.includes(:doctors)
    authorize! :show, Patient
  end
end
