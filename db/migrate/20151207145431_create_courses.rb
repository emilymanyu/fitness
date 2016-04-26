class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :address
      t.string :link

      t.timestamps null: false
    end
  end
end
