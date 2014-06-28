class User < ActiveRecord::Base

  has_one :preference
  validates :username, :password, :img, :age, :gender, :bio, presence: true


  def self.gender_matches(user)
    where(:gender => user.preference.gender_pref)
  end

  def self.age_matches(user)
    User.where('users.age >= ? AND users.age < ?', user.preference.min_age, user.preference.max_age)
  end

  def self.activity_matches(user)
    User.joins(:preference).where('preferences.activity_type_id = ? AND users.id != ?', user.preference.activity_type.id, user.id) 
  end

  def male?
    self.gender == 'male'
  end

  def female?
    self.gender == 'female'
  end

  def self.find_matches(user)
    gender_matches(user).age_matches(user).activity_matches(user)
  end

end
