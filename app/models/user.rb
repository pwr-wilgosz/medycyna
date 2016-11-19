class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  AVAILABLE_ROLES = [:patient, :doctor, :pharmacist]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :receipts
  has_many :added_receipts, class_name: 'Receipt', foreign_key: 'doctor_id'

  validates :pesel, presence: true, uniqueness: true

  def full_name
    [first_name, last_name].join(' ')
  end

  def to_s
    full_name
  end

  AVAILABLE_ROLES.each do |r|
    define_method "#{r}?" do
      role == r.to_s
    end
  end
end

