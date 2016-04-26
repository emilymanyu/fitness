class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :strat_time
      t.string :end_time
      t.integer :distance
      t.string :progress
      t.string :state

      t.timestamps null: false
    end
  end
end
