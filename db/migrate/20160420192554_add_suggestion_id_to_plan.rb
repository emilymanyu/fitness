class AddSuggestionIdToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :suggestion_id, :integer
  end
end
