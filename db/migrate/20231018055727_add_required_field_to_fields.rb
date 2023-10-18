class AddRequiredFieldToFields < ActiveRecord::Migration[7.0]
  def change
    add_column :fields, :required, :boolean, default: true
  end
end
