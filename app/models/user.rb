class User < ActiveRecord::Base

  has_one :preference
  validates :username, :password, :img, :age, :gender, :bio, presence: true

end