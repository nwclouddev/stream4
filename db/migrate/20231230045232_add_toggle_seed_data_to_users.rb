# frozen_string_literal: true

class AddToggleSeedDataToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :toggle_seed_data, :boolean
  end
end
