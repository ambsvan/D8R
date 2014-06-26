class ChangeAgeRangeToString < ActiveRecord::Migration
  def change
      change_table :preferences do |t|
      t.remove :age_range
      t.string :age_range
    end
  end
end