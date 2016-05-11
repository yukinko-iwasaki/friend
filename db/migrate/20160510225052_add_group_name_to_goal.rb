class AddGroupNameToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :group_name, :string
    add_column :goals, :string, :string
  end
end
