class Preference < ActiveRecord::Base

  belongs_to :user
  has_one :activity

end