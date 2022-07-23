require 'rails_helper'

RSpec.describe "Login as doctor and left a rec for a patient", type: :feature do
  let(:patient) {FactoryBot.create(:patient)}
  let(:category) {FactoryBot.create(:category)}
  let(:doctor) {FactoryBot.create(:doctor, category: category)}
  let!(:appointment) {FactoryBot.create(
                     :appointment, doctor: doctor, patient: patient)}

  it "Doctor creates a new recommendation" do
    login
    open_patient_record
    make_recommendation

    expect(page).not_to have_content(patient.phone_number)
  end

private

  def login
    visit  new_user_session_path
    fill_in 'Phone number', with: doctor.phone_number
    fill_in 'Password', with: doctor.password
    click_button 'Log in'
  end

  def open_patient_record
    click_button 'make an recommendation'
    visit  edit_appointment_path(appointment)
  end

  def make_recommendation
    fill_in 'Recommendation', with: 'recommendation'
    click_button 'save this recommendation'
  end
end
