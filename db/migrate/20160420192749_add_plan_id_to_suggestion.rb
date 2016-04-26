class AddPlanIdToSuggestion < ActiveRecord::Migration
  def change
    add_column :suggestions, :plan_id, :integer
  end
end
