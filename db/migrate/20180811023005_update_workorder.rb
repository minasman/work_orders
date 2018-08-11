class UpdateWorkorder < ActiveRecord::Migration
  def change
    rename_column :workorders, :store, :store_number
    add_column :workorders, :user_id, :integer
    add_column :workorders, :status, :string
    add_column :workorders, :closed_by, :string
    add_column :workorders, :closed_notes, :string
  end
end
