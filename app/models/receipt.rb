class Receipt < ApplicationRecord
  belongs_to :user, dependent: :destroy
end

