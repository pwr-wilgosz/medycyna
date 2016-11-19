json.extract! line_item, :id, :name, :usage, :amount, :receipt_id, :refunded, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)