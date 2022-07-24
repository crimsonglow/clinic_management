class Doctor < User
  belongs_to :category, optional: true
  has_many :appointments
  has_many :patients, through: :appointments
  has_one_attached :avatar

  validates_uniqueness_of :phone_number, case_sensitive: false
end
