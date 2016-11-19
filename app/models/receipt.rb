class Receipt < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :doctor, class_name: 'User', dependent: :destroy
  has_many :line_items

  validates :user, :doctor, presence: true

  accepts_nested_attributes_for :line_items,
    reject_if: proc { |attributes| attributes[:name].blank? || attributes[:amount].to_i.zero? }, allow_destroy: true
end

