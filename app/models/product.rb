class Product < ActiveRecord::Base

  #associations code
  has_many :owners
  has_many :requests
  has_many :markets, through: :owners
  #validations code
  validates :name, presence: true, length: { maximum: 50 }
  validates :label, presence: true, length: { maximum: 50 }
  validates :package, presence: true, length: { maximum: 50 }

end
