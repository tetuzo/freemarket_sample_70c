class AddSizeToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :size_id, :integer
  end
end
