class AddMembeToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :member, :string
  end
end
