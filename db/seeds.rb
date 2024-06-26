# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#

User.create(email: 'adam2@nwclouddev.com', first_name: 'Adam', last_name: 'Johnson', password: 'password',
            password_confirmation: 'password', admin: true)

['Some Action Title', 'Some Comedy Title', 'Some Drama Title', 'Some Horror Title'].each do |title|
  Title.find_or_create_by!(name: title)
end

%w[Action Comedy Drama Horror].each do |_content_group|
  ContentGroup.find_or_create_by!(name: genre_name)
end
