class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.string :name
      t.text :usage
      t.integer :amount
      t.references :receipt, foreign_key: true
      t.integer :refunded

      t.timestamps
    end
  end
end
