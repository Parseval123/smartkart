class Creationreport < ActiveRecord::Base

  #associations code
  belongs_to :market
  belongs_to :manager

end
