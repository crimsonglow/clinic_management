FactoryBot.define do
  factory :patient do
    name { FFaker::Name.name}
    phone_number { FFaker::PhoneNumberUA.international_mobile_phone_number }
    password { "password" }
    password_confirmation { "password"}
  end

  factory :doctor do
    name { FFaker::Name.name}
    phone_number { FFaker::PhoneNumberUA.international_mobile_phone_number }
    password { "password" }
    password_confirmation { "password"}
    category
  end

  factory :category do
    name { FFaker::HealthcareRU.doctor_specialization }
  end

  factory :appointment do
    doctor
    patient
    status { :active }
  end
end
