class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :type
      t.string :comment
      t.integer :star

      t.timestamps null: false
    end
  end
end
