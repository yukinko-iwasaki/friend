class Goal < ActiveRecord::Base


  has_many :tracks
  has_many :users, :through => :tracks
  belongs_to :members

  

end
