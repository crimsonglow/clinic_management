class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.patient?
      can :create, Appointment
      can :read, Patient
    elsif user.doctor?
      can :update, Appointment
      can :read, Doctor
    end
  end
end
