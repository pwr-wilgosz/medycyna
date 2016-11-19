class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      case user.role
      when 'doctor'
        can [:manage], Receipt
        can [:manage], User
      when 'pharmacist'
        can [:read, :update], Receipt
      end
    end
  end
end

