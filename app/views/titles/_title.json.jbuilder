json.extract! title, :id, :name, :desccription, :content_url, :thumbnail_url, :year, :user_id, :created_at, :updated_at
json.url title_url(title, format: :json)
