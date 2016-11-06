json.extract! receipt, :id, :user_id, :closed, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)