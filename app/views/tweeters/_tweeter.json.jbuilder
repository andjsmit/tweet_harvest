json.extract! tweeter, :id, :twuser_id, :screen_name, :name, :url, :created_at, :updated_at
json.url tweeter_url(tweeter, format: :json)
