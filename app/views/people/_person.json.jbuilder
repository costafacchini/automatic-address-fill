json.extract! person, :id, :name, :postal_code, :city_id, :created_at, :updated_at
json.url person_url(person, format: :json)
