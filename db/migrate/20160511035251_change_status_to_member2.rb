class ChangeStatusToMember2 < ActiveRecord::Migration
  def change

    change_column_default :members, :status,false
  end
end
