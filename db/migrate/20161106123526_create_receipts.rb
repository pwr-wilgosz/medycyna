class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.references :user, foreign_key: true
      t.boolean :closed

      t.timestamps
    end
  end
end
