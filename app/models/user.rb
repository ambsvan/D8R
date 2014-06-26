class User < ActiveRecord::Base

  has_many :preferences
  validates :username, :password, :img, :age, :gender, :bio, presence: true

end