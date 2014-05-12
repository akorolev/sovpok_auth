json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :price, :pickup_allowed, :pickup_description, :postage_val1, :postage_info1, :postage_val2, :postage_info2, :postage_val3, :postage_info3, :user_id, :category_id, :lot_id
  json.url product_url(product, format: :json)
end
