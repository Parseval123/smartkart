class Micropost < ActiveRecord::Base

  #associations code
  belongs_to :user
  belongs_to :market
  #order microposts code (dal più recente al più vecchio)
  default_scope -> { order(created_at: :desc)}
  #validations code
  validates :user_id, presence: true
  validates :market_id, presence: true  
  validates :content, presence: true, length:{ maximum:140 }
  validates :vote, presence: true, inclusion: { in:1..5 }

end
