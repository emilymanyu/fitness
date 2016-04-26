class AddMicropostIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :micropost_id, :integer
  end
end
