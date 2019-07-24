json.extract! rating, :id, :business_profile_id, :star_rating, :comment, :created_at, :updated_at
json.url rating_url(rating, format: :json)
