require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  describe "post appointments#create" do
    let(:patient) {FactoryBot.create(:patient)}
    let(:category) {FactoryBot.create(:category)}
    let(:doctor) {FactoryBot.create(:doctor, category: category)}

    it "should save the new appointment in the database" do
      sign_in(patient)
      params = {doctor_id: doctor.id, patient_id: patient.id, status: :active}
      post(appointments_path, params: params)

      appointment = Appointment.last

      expect(params[:doctor_id]).to eq(appointment.doctor_id)
      expect(params[:patient_id]).to eq(appointment.patient_id)
      expect(appointment.id).not_to eq(0)
      expect(appointment.status).to eq('active')

      expect(response.status).to eq(302)
      expect(response).to redirect_to(patient_path(patient.id))
    end
  end
end
