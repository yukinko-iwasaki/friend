class AddProgressToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :progress, :integer
  end
end
