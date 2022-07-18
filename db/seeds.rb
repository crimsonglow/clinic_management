AdminUser.create!(phone_number: '+380665566556', password: 'password', password_confirmation: 'password')

3.times { Category.create(name: FFaker::HealthcareRU.doctor_specialization) }

5.times do
  Patient.create(name: FFaker::Name.name,
    phone_number: FFaker::PhoneNumberUA.international_mobile_phone_number,
    password: 'password'
  )
end

5.times do
  Doctor.create(name: FFaker::Name.name,
    phone_number: FFaker::PhoneNumberUA.international_mobile_phone_number,
    password: 'password',
    category: Category.all.sample
  )
end
