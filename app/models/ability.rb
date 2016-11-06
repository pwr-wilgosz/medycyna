class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      case user.role
      when 'doctor'
        can [:read, :create, :update], Receipt
      when 'pharmacist'
        can [:read, :update], Receipt
      end
    end
  end
end

