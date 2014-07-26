class AddEvaluationidToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :evaluation_id, :integer
    add_index :goals, :evaluation_id
  end
end
