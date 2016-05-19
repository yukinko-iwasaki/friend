class Group < ActiveRecord::Base
  has_many :members
  has_many :users,through: :members
  accepts_nested_attributes_for :members, allow_destroy: true
  has_many :goals

end
