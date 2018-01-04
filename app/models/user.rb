class User < ActiveRecord::Base

  #associations code
  has_many :shoppers
  has_many :microposts, dependent: :destroy 
  #validations code
  validates :name, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 30 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  VALID_ADDRESS_REGEX = /\A([a-zA-Z]|\s)+,\s(0|1|2|3|4|5|6|7|8|9)+,\s(0|1|2|3|4|5|6|7|8|9){5}\s([a-zA-Z]+\s)+[A-Z]{2}\z/i
  validates :address, presence: true, length: { maximum: 60 }, format: { with: VALID_ADDRESS_REGEX }
  validates :yearofbirth, presence: true, inclusion: { in:1930..2000 }
  #code for security
  has_secure_password
  validates :password, length:{ minimum: 8 }
  #code for geocoder
  geocoded_by :address
  after_validation :geocode

end
