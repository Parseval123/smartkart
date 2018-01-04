class Micropostreport < ActiveRecord::Base

  #associations code
  belongs_to :user
  belongs_to :micropost 
  #validations code
  validates :micropost_id, uniqueness: true

end
