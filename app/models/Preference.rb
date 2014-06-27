class Preference < ActiveRecord::Base

  belongs_to :user
  has_one :activity

#finds a match for the current user preferences 

  def self.find_gender_match(user_preferences)
    #finds a list of matches for current user prefs and returns it 
    gender_match = User.where(gender: user_preferences.gender_pref)
  end

  #finds a preference where date type is same as current user preferenes date type
  def self.find_date_type_match(user_preferences)
    date_type_match = Preference.where(date_type: user_preferences.date_type)
    #returns a list of preferences with date type match
  end

  def self.find_age_range_match(user_preferences)
    current_users_age_range_pref = user_preferences.age_range
    array = current_users_age_range_pref.split(',').map { |x| x.to_i }
   age_range_array = array[0]..array[1]
   for i in age_range_array
    return i
  end

    # ages = Preference.find(6).age_range.split
  end

  # def find_age_range_values(matches)
  #   matches.each do |x|
  #     x.age_range.select{|j| j =~ (\d{2})}
  # end

end

# # Widget.where('created_at > ? AND 
#   created_at < ?', 2.hours.ago, Time.now)

# age_range.select{|j| j =~ (\d{2})}