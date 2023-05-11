class ChangeDataSerialNumberToItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :serial_number, :string
  end
end
