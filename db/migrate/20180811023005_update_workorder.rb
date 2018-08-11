class UpdateWorkorder < ActiveRecord::Migration
  def change
    rename_column :workorders, :store, :store_number
    add_column :workorders, :user_id, :integer
    add_column :workorders, :current_update_id, :integer
    add_column :workorders, :status, :string
  end
end
