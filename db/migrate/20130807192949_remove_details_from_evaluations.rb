class RemoveDetailsFromEvaluations < ActiveRecord::Migration
  def up
    remove_column :evaluations, :tacademia
    remove_column :evaluations, :sexo
    remove_column :evaluations, :mmagrap
    remove_column :evaluations, :mcoxa
    remove_column :evaluations, :tflex
  end

  def down
    add_column :evaluations, :tflex, :integer
    add_column :evaluations, :mcoxa, :integer
    add_column :evaluations, :mmagrap, :integer
    add_column :evaluations, :sexo, :string
    add_column :evaluations, :tacademia, :date
  end
end
