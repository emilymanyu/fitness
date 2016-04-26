class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :from_name
      t.string :to_name
      t.string :status

      t.timestamps null: false
    end
  end
end
