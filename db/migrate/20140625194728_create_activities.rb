class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :location
      t.string :img
      t.string :date_type
    end



  end
end
