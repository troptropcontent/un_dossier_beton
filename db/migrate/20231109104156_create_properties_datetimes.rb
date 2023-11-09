class CreatePropertiesDatetimes < ActiveRecord::Migration[7.0]
  def change
    create_table :properties_datetimes do |t|
      t.datetime :value
      t.references :item, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
