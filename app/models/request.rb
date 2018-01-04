class Request < ActiveRecord::Base

  #associations code
  belongs_to :shopper
  belongs_to :product
  #validations code
  validates :shopper_id, presence: true
  validates :product_id, presence: true

end
