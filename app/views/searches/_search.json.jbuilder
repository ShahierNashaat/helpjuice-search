json.extract! search, :id, :ip, :search_text, :search_numbers, :created_at, :updated_at
json.url search_url(search, format: :json)
