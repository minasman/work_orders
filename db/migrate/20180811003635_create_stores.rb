class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |s|
      s.string :name
      s.string :store_number
      s.string :email
    end
  end
end
