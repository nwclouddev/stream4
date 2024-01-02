class AddUniqIndexToContentGroupsUsers < ActiveRecord::Migration[7.1]
  def change
    add_index :content_groups_users, :user_id
    add_index :content_groups_users, :content_group_id
  end
end
