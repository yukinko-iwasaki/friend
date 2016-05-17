class ChangeToPeriodToTrack < ActiveRecord::Migration
  def change

 change_column :tracks, :period, :integer, default: 0

  end
end
