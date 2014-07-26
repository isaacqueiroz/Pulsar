class AddEvaluationToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :evaluation_id, :integer
  end
end
