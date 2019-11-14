json.extract! equipment, :id, :equipment_id, :name, :brand, :model, :description, :price, :created_at, :updated_at
json.url equipment_url(equipment, format: :json)
