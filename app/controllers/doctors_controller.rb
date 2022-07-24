class DoctorsController < ApplicationController

  def show
    @active_patients = current_user.appointments.includes([:patient]).active
    authorize! :show, Doctor
  end

  def update
    @doctor = Doctor.find(params[:id])

    if @doctor.update(doctor_params)
      redirect_to doctor_path
    end
    authorize! :update, Doctor
  end

private

  def doctor_params
    params.require(:doctor).permit(:avatar)
  end
end
