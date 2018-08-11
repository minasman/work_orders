class CreateWorkorders < ActiveRecord::Migration
  def change
    create_table :workorders do |w|
      w.string :store
      w.string :date
      w.string :time
      w.string :issue
    end
  end
end
