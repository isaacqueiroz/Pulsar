class RemoveEvaluationidFromGoals < ActiveRecord::Migration
  def up
    remove_column :goals, :evaluation_id
  end

  def down
    add_column :goals, :evaluation_id, :integer
  end
end
