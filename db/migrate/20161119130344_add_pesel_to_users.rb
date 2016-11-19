class AddPeselToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pesel, :string
    add_index :users, :pesel, unique: true
  end
end

