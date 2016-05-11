class RenameMemberColumnToMembers < ActiveRecord::Migration
  def change
    rename_column :groups, :member, :members
  end
end
