# frozen_string_literal: true

class CreateJoinTableUserContentGroup < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :content_groups do |t|
      t.index [:user_id, :content_group_id]
      t.index [:content_group_id, :user_id]
    end
  end
end
