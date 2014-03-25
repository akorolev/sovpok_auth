json.array!(@lots) do |lot|
  json.extract! lot, :id, :title, :description, :end_date, :prepay, :fee, :min_order, :pickup_allowed, :pickup_description, :postage_val1, :postage_info1, :postage_val2, :postage_info2, :postage_val3, :postage_info3, :source, :serial, :keywords, :status, :category_id, :user_id
  json.url lot_url(lot, format: :json)
end
