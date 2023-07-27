json.extract! adress, :id, :name, :street_name, :street_number, :city, :created_at, :updated_at
json.url adress_url(adress, format: :json)
