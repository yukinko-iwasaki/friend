class AddPeriodToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :period, :integer, default: 0
  end
end
