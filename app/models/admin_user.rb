class AdminUser < ApplicationRecord
  devise :database_authenticatable, 
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
end
