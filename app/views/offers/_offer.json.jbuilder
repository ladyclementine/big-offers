json.extract! offer, :id, :title, :description, :avatar, :price, :created_by, :created_at, :updated_at
json.url offer_url(offer, format: :json)
