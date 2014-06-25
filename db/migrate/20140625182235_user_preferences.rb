class UserPreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.string :gender_pref
      t.integer :age_range
      t.string :date_type
    end
  end
end
