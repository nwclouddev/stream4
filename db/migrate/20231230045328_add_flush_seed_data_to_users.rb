class AddFlushSeedDataToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :flush_seed_data, :boolean
  end
end
