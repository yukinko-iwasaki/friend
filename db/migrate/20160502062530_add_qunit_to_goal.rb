class AddQunitToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :qunit, :string
  end
end
