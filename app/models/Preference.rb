class Preference < ActiveRecord::Base

  belongs_to :user
  belongs_to :activity_type

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

  # @young_adult = [18, 19, 20, 21 , 22, 23, 24, 25]
  # @mid_life = [26, 27, 28, 29, 30 , 31 , 32, 33, 34, 35]
  # @adult = [36, 37, 38, 39, 40, 41, 42, 43, 44, 45]
  # @silver_fox = [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86. 87. 88. 89. 90. 91. 92. 93. 94. 95. 96. 97. 98. 99]

  def self.find_age_range_match(user_preferences)
    @users = User.all
    if user_preferences.age_range == "18-25"
      @users.select {|u| u.age >= 18 && u.age <= 25}
    end
  end
end
    #   User.map { |user| user.age >= 18 && user.age <= 25 }
    #  User.map {|age_range| }
    # elsif user_preferences.age_range == "26-35"
    #   User.map { |user| user.age >= 26 && user.age <= 25 }
    #if user_preference.age_rage == "26-35"

    # if user_preference.age_range == "36-45"

    # if user_preference.age_range == "45+"
    #     true
    #   end
    # end
