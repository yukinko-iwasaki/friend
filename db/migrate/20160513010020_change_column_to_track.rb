class ChangeColumnToTrack < ActiveRecord::Migration
  def change
    change_column :tracks, :check, :boolean, default: false
  end
end
