class UpdateWorkorder2 < ActiveRecord::Migration
  def change
    add_column :workorders, :store_id, :integer
  end
end
