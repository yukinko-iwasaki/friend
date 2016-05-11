class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :comments

  has_many :tracks
  has_many :goals, :through=> :tracks
  has_many :members
  has_many :groups, through: :members
 
  

end
