class ChangeStatusToMember < ActiveRecord::Migration
   def up
    change_column :members, :status, :boolean,default: false
  end

  # 変更前の状態
  def down
    change_column :members, :status, :boolean
  end
end
