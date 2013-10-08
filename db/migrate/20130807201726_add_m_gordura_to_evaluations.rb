class AddMGorduraToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :mgordura, :integer
  end
end
