class CreateConfigurationsAggregates < ActiveRecord::Migration[7.0]
  def change
    create_table :configurations_aggregates do |t|
      t.references :field, null: false, foreign_key: true
      t.references :field_to_aggregate, null: false, foreign_key: {to_table: :fields}

      t.timestamps
    end
  end
end
