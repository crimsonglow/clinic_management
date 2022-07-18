class AppointmentsController < ApplicationController
  before_action :current_appointment, only: [:edit, :update]
  before_action :require_create, only: [:create]

  def edit
    authorize! :edit, Appointment
  end

  def create
    @appointment = Appointment.new(
      doctor_id: doctor_id,
      patient_id: current_user.id,
      status: :active
    )

    if @appointment.save
      redirect_to patient_path(current_user.id)
    else
      redirect_to patient_path
    end
    authorize! :create, Appointment
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_path
    else
      render 'edit'
    end
    authorize! :update, Appointment
  end

private

  def current_appointment
    @appointment = Appointment.find(params[:id])
  end

  def doctor_id
    params.require(:doctor_id)
  end

  def appointment_params
    params.require(:appointment).
    permit(:recommendation).
    merge(status: :inactive)
  end

  def require_create
    max_appointments_for_doctor = 10
    doctor = Doctor.find(doctor_id)
    if doctor.appointments.active.count >= max_appointments_for_doctor
      redirect_to patient_path(id: current_user.id)
    end
  end

end
