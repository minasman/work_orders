class CreateCurrentUpdate < ActiveRecord::Migration
  def change
    create_table :current_updates do |c|
      c.string :date
      c.string :time
      c.string :notes
      c.string :username
      c.integer :workorder_id
    end
  end
end
