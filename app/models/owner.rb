class Owner < ActiveRecord::Base

  #association code
  belongs_to :product
  belongs_to :market
  #validations code
  validates :product_id, presence: true
  validates :market_id, presence: true
  validates :product_id, :uniqueness => { :scope => :market_id }
  validates :price, presence: true
  validates :stock, presence: true

end
