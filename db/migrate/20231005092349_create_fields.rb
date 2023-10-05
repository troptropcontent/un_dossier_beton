class CreateFields < ActiveRecord::Migration[7.0]
  def change
    create_table :fields do |t|
      t.integer :kind
      t.references :schema, null: false, foreign_key: true
      t.string :name
      t.string :normalized_name

      t.timestamps
    end
  end
end
