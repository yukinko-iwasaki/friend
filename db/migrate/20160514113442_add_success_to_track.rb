class AddSuccessToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :success, :boolean, default: false

  end
end
