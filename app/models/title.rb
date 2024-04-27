# frozen_string_literal: true

class Title < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :content_groups

  validates :name, :description, :year, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[name description year created_at]
  end

  def thumbnail_slug
    case Rails.env
    when 'development'
      "/assets/#{thumbnail_url}"
    when 'production'
      "/#{thumbnail_url}"
    else
      "/#{thumbnail_url}"
    end
  end

  def content_slug
    case Rails.env
    when 'development'
      "/assets/#{content_url}"
    when 'production'
      "/#{content_url}"
    else
      "/#{content_url}"
    end
  end
end
