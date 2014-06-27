class Preference < ActiveRecord::Base

  belongs_to :user
  has_one :activity

#finds a match for the current user preferences 

  def self.find_gender_match(user_preferences)
    #finds a list of matches for current user prefs and returns it 
    gender_match = User.where(gender: user_preferences.gender_pref)
  end

  def self.find_date_type_match(user_preferences)
    date_type_match = Preference.where(date_type: user_preferences.date_type)
  end

  # def find_age_range_values(matches)
  #   matches.each do |x|
  #     x.age_range.select{|j| j =~ (\d{2})}
  # end

end

# # Widget.where('created_at > ? AND 
#   created_at < ?', 2.hours.ago, Time.now)

# age_range.select{|j| j =~ (\d{2})}