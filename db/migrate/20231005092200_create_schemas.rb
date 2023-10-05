class CreateSchemas < ActiveRecord::Migration[7.0]
  def change
    create_table :schemas do |t|
      t.references :holder, polymorphic: true, null: false

      t.timestamps
    end
  end
end
