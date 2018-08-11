class CreateWorkorders < ActiveRecord::Migration
  def change
    create_table :workorders do |w|
      w.string :store
      w.date :date
      w.time :time
      w.string :issue
    end
  end
end
