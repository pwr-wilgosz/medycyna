class Receipt < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :doctor, class_name: 'User', dependent: :destroy

  validates :user, :doctor, presence: true

end

