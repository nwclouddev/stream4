class CreateJoinTableContentGroupTitle < ActiveRecord::Migration[7.1]
  def change
    create_join_table :content_groups, :titles do |t|
      # t.index [:content_group_id, :title_id]
      # t.index [:title_id, :content_group_id]
    end
  end
end
