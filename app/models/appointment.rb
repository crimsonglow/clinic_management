class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  enum status: {active: 1, inactive: 0}
end
