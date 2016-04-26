class AddRequestIdToSuggestion < ActiveRecord::Migration
  def change
    add_column :suggestions, :request_id, :integer
  end
end
