# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar
  has_person_name
  has_noticed_notifications

  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :services

  has_and_belongs_to_many :content_groups
  has_and_belongs_to_many :favorite_content_groups, class_name: 'ContentGroup'

  def favorite_titles
    Title.joins(:content_groups).where(content_groups: { id: favorite_content_groups.select(:id) })
  end

  before_save :check_toggle_seed_data
  before_commit :check_flush_seed_data
  before_destroy :remove_other_models

  def check_toggle_seed_data
    return unless toggle_seed_data == true

    require 'csv'
    Title.destroy_all
    f = File.open(Rails.root.join('seed.csv'))

    CSV.foreach(f, headers: true) do |row|
      Title.create!(
        name: row[0],
        description: ActionView::Base.full_sanitizer.sanitize(row[1]),
        year: row[2].to_i,
        content_url: row['Content URL'],
        thumbnail_url: row['Thumbnail URL'],
        user: User.first
      )
    end
    self.toggle_seed_data = false
    save!
  end

  def check_flush_seed_data
    return unless flush_seed_data == true

    Title.destroy_all
    Title.create(
      name: 'Test',
      description: 'Test Description',
      year: 2023,
      content_url: 'content/oceans.mp4',
      thumbnail_url: 'content/elf.jpg',
      user: User.first
    )
    Title.create(
      name: 'Hello',
      description: 'Hello Description',
      year: 2023,
      content_url: 'content/oceans.mp4',
      thumbnail_url: 'content/elf.jpg',
      user: User.first
    )
    self.flush_seed_data = false
    save!
  end

  private

  def remove_other_models
    byebug
    other_models.clear
  end
end
