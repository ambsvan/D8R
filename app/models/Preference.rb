class Preference < ActiveRecord::Base

  belongs_to :user
  belongs_to :activity_type

#finds a match for the current user preferences 
end