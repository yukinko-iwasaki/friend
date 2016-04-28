class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :goal_id
      t.string :comment

      t.timestamps null: false
    end
  end
end
