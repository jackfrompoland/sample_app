# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null

# w pliku "user_spec.rb" mamy opis tego jak bedziemy testowac
# klase "User", co powinna miec a czego nie

# tutaj uzywamy slowa kluczowego "validates" "nazwa_zmiennej" "obecnosc zmiennej" => zwraca true
#  validates :name, :presence, podczas 
#  validates :email, :presence => true

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase } #zapewnia, ze kazdy email jest zapisany bez duzych liter, pomaga to w indeksowaniu tego pola

  validates :name, :presence => true, :length => { :maximum => 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, 
            :format => { :with => VALID_EMAIL_REGEX }, 
            :uniqueness => { :case_sensitive => false }
            validates :password, :presence => true, :length => { :minimum => 6 }
            validates :password_confirmation, :presence => true
end