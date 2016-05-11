class Track < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user

  def self.total_on(date)
    where("date(created_at) = ?",date).sum(:quantity)
  end
end
