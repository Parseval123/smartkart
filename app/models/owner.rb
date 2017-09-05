class Owner < ActiveRecord::Base

  belongs_to :product
  belongs_to :market

  validates :product_id, :uniqueness => { :scope => :market_id }

end
