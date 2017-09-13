class Market < ActiveRecord::Base

  #associations code
  has_many :microposts, dependent: :destroy
  has_many :owners
  has_one :manager
  #validations code
  VALID_ADDRESS_REGEX = /\A([a-z]+\s)*+\,/i
  #validates :address, presence: true, length: { maximum: 60 }, format: { with: VALID_ADDRESS_REGEX }
  validates :group, presence: true, length: { maximum: 15 }
  validates :info, presence: true, length:{ maximum:100 }
  #code for geocoder
  geocoded_by :address
  after_validation :geocode

end
