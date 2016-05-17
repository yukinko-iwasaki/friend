class AddColumnToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :check, :boolean
  end
end
