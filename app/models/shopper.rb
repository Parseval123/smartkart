class Shopper < ActiveRecord::Base
  #associations code
  has_many :requests
  belongs_to :user
  has_many :request
  #validations code
  validates :user_id, presence: true
end
