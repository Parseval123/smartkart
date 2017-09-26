class Market < ActiveRecord::Base

  #associations code
  has_many :microposts, dependent: :destroy
  has_many :owners
  has_one :manager
  #validations code
  VALID_ADDRESS_REGEX = /\A([a-zA-Z]|\s)+,\s(0|1|2|3|4|5|6|7|8|9)+,\s(0|1|2|3|4|5|6|7|8|9){5}\s([a-zA-Z]+\s)+[A-Z]{2}\z/i
  validates :address, presence: true, length: { maximum: 60 }, format: { with: VALID_ADDRESS_REGEX }
  validates :group, presence: true, length: { maximum: 15 }
  validates :info, presence: true, length:{ maximum:100 }
  #code for geocoder
  geocoded_by :address
  after_validation :geocode

end
