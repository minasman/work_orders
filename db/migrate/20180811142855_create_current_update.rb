class CreateCurrentUpdate < ActiveRecord::Migration
  def change
    create_table :current_updates do |c|
      c.date :date
      c.time :time
      c.string :notes
      c.string :username
      c.integer :workorder_id
    end
  end
end
