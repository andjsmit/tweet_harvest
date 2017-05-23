json.extract! data_set, :id, :name, :description, :source, :filename, :created_at, :updated_at
json.url data_set_url(data_set, format: :json)
