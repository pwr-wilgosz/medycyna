class AddCreatedByToReceipts < ActiveRecord::Migration[5.0]
  def change
    add_reference :receipts, :doctor
  end
end

