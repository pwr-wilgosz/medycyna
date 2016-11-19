class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      case user.role
      when 'doctor'
        can [:manage], Receipt, doctor_id: user.id
        can [:read, :create], Receipt
        can [:manage], User
      when 'pharmacist'
        can [:read, :update], Receipt
      else
        can :show, User, id: user.id
        can :show, Receipt, user_id: user.id
      end
    end
  end
end

