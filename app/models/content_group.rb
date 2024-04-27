# frozen_string_literal: true

class ContentGroup < ApplicationRecord
  has_and_belongs_to_many :titles

  validates :name, :description, presence: true
end
