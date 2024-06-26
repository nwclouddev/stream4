# frozen_string_literal: true

json.extract! content_group, :id, :name, :description, :created_at, :updated_at
json.url content_group_url(content_group, format: :json)
