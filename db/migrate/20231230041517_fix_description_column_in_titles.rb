class FixDescriptionColumnInTitles < ActiveRecord::Migration[7.1]
  def change
    rename_column :titles, :desccription, :description
  end
end
