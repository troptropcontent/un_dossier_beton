Project.destroy_all

project = Project.create(name: 'A fake company')

folder = project.folders.create!(name: 'France Agrimer 2023')

folder_schema = Schema.create!(holder: folder)

folder_schema_date_field = folder_schema.fields.create!(name: 'Date', kind: :date)
folder_schema_currency_field = folder_schema.fields.create!(name: 'Montant provisionné', kind: :currency)
folder_schema_folder_field = folder_schema.fields.create!(name: 'Factures', kind: :folder)
folder_schema_folder_field_schema = Schema.create!(holder: folder_schema_folder_field)
folder_schema_folder_field_schema_folder_field = folder_schema_folder_field_schema.fields.create!(name: 'Facture', kind: :document)
folder_schema_folder_field_schema_date_field = folder_schema_folder_field_schema.fields.create!(name: 'Date', kind: :date)
folder_schema_folder_field_schema_currency_field = folder_schema_folder_field_schema.fields.create!(name: 'Montant', kind: :currency)

folder_schema_aggregate_field = folder_schema.fields.create!(name: 'Total Factures', kind: :aggregate, required: false)
folder_schema_aggregate_field_configuration = Configurations::Aggregate.create!(field: folder_schema_aggregate_field, field_to_aggregate: folder_schema_folder_field_schema_currency_field)



50.times do |n|
  event_number = n+1
  item = folder.items.create!(name: "EVENEMENT #{event_number.to_s.rjust(5,"0")}")

  Properties::Date.create!(field: folder_schema_date_field, item: item, value: Date.today) if rand(0..1) == 1
  Properties::Currency.create!(field: folder_schema_currency_field, item: item, value: rand(99.0)) if rand(0..1) == 1
  property_folder = Properties::Folder.create!(field: folder_schema_folder_field, item: item)
  property_folder_folder = property_folder.value
  rand(1..3).times do |n|
    item_number = n+1
    item = property_folder_folder.items.create!(name: "FACTURE #{item_number.to_s.rjust(5,"0")}")
    Properties::Date.create!(field: folder_schema_folder_field_schema_date_field, item: item, value: Date.today)
    Properties::Currency.create!(field: folder_schema_folder_field_schema_currency_field, item: item, value: rand(99.0))
    property_document = Properties::Document.create!(field: folder_schema_folder_field_schema_folder_field, item: item)
    property_document.file.attach(io: File.open("app/assets/pdfs/facture_test.pdf"), filename: 'file.pdf')
  end
end


folder_schema_aggregate_field.update(index: 2)
folder_schema_folder_field.update(index: 3)