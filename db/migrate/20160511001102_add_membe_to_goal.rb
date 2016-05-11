class AddMembeToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :member, :string
  end
end
