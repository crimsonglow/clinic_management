class Doctor < User
  belongs_to :category, optional: true
  has_many :appointments
  has_many :patients, through: :appointments

  validates_uniqueness_of :phone_number, case_sensitive: false
end
