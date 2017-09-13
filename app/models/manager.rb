class Manager < ActiveRecord::Base

  #associations code
  belongs_to :market
  #validations code
  validates :name, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 30 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  VALID_TEL_REGEX = /\A(0|1|2|3|4|5|6|7|8|9){6,10}\z/i
  validates :tel, presence: true, format: { with: VALID_TEL_REGEX }
  validates :yearofbirth, presence: true, inclusion: { in:1930..2000 }
  validates :curriculum, presence: true, length:{ maximum:300 } 
  #code for security
  has_secure_password
  validates :password, length:{ minimum: 8 }

end
