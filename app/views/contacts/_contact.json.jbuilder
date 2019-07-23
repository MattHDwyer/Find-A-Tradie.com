json.extract! contact, :id, :email, :mobile_number, :landline_number, :address, :created_at, :updated_at
json.url contact_url(contact, format: :json)
