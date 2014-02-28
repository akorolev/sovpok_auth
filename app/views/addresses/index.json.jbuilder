json.array!(@addresses) do |address|
  json.extract! address, :id, :name, :street1, :street2, :suburb, :city, :postcode, :phone, :user_id
  json.url address_url(address, format: :json)
end
