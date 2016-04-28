class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :user_id
      t.integer :goal_id
      t.integer :quantity
      t.string :quantity_unit

      t.timestamps null: false
    end
  end
end
