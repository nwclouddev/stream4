# frozen_string_literal: true

class AddVisitedAtToTitles < ActiveRecord::Migration[7.1]
  def change
    add_column :titles, :visited_at, :datetime
  end
end
