# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Project.destroy_all

project = Project.create(name: 'France Agrimer')

folder = project.folders.create!(name: '2023')

folder_schema = Schema.create!(holder: folder)

folder_schema_date_field = folder_schema.fields.create!(name: 'Date', kind: :date)
folder_schema_currency_field = folder_schema.fields.create!(name: 'Montant provisionné', kind: :currency)
folder_schema_folder_field = folder_schema.fields.create!(name: 'Factures', kind: :folder)
folder_schema_folder_field_schema = Schema.create!(holder: folder_schema_folder_field)
folder_schema_folder_field_schema_date_field = folder_schema_folder_field_schema.fields.create!(name: 'Date', kind: :date)
folder_schema_folder_field_schema_currency_field = folder_schema_folder_field_schema.fields.create!(name: 'Montant', kind: :currency)
folder_schema_folder_field_schema_folder_field = folder_schema_folder_field_schema.fields.create!(name: 'Facture', kind: :document)



50.times do |n|
  event_number = n+1
  item = folder.items.create!(name: "EVENEMENT #{event_number.to_s.rjust(5,"0")}")

  Properties::Date.create!(field: folder_schema_date_field, item: item, value: Date.today)
  Properties::Currency.create!(field: folder_schema_currency_field, item: item, value: rand(99.0))
  Properties::Folder.create!(field: folder_schema_folder_field, item: item)
end


