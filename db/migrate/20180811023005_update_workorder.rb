class UpdateWorkorder < ActiveRecord::Migration
  def change
    rename_column :workorders, :store, :store_number
    add_column :workorders, :user_id, :integer
  end
end
