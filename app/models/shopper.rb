class Shopper < ActiveRecord::Base

  #associations code
  has_many :requests
  belongs_to :user
  has_many :products, :through => :requests
  #validations code
  validates :user_id, presence: true

end
