# frozen_string_literal: true

class Title < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :content_groups

  validates :name, :description, :year, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[name description year created_at]
  end

  def thumbnail_slug
    "/#{thumbnail_url}"
  end

  def content_slug
    "/#{content_url}"
  end
end
