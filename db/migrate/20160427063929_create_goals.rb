class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :goal_name
      t.integer :quantity
      t.integer :frequency
      t.string :frequency_unit


      t.timestamps null: false
    end
  end
end
