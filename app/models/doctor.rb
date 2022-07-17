class Doctor < User
  belongs_to :category, optional: true
  has_many :appointments
  has_many :patients, through: :appointments

  validates :phone_number, uniqueness: true
end
