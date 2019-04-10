json.extract! place, :id, :title, :description, :price, :duration, :schedule, :lat, :lng, :created_at, :updated_at
json.url place_url(place, format: :json)
