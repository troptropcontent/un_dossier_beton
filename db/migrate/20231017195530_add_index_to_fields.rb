class AddIndexToFields < ActiveRecord::Migration[7.0]
  def change
    add_column :fields, :index, :integer, default: 0, null: false
  end
end
