class Preference < ActiveRecord::Base

  belongs_to :user
  has_one :activity

#finds a match for the current user preferences 

  def self.find_match(user_preferences)
    u = User.where(age: user_preferences.age_range, gender: user_preferences.gender_pref)
    return u
  end

end