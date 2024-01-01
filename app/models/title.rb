class Title < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :content_groups

  validates :name, :description, :year, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "year"]
  end

  def thumbnail_slug
    case Rails.env
    when "development"
      thumbnail_slug = "/assets/#{thumbnail_url}"
    when "production"
      thumbnail_slug = "/#{thumbnail_url}"
    else
      thumbnail_slug = "/#{thumbnail_url}"
    end
  end

  def content_slug
    case Rails.env
    when "development"
      thumbnail_slug = "/assets/#{content_url}"
    when "production"
      thumbnail_slug = "/#{content_url}"
    else
      thumbnail_slug = "/#{content_url}"
    end
  end

end
