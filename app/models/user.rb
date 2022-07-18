class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def email_required?
    false
  end

  def email_in_database?
    false
  end

  def will_save_change_to_email?
    false
  end

  def patient?
    type == 'Patient'
  end

  def doctor?
    type == 'Doctor'
  end
end
