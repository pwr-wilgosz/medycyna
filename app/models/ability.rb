class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      case user.role
      when 'doctor'
        can [:manage], Receipt
        can [:read, :create, :update], User
      when 'pharmacist'
        can [:read, :update], Receipt
      end
    end
  end
end

