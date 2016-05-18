class Member < ActiveRecord::Base
belongs_to :group
belongs_to :users
has_many :goals


end
