class RemoveMetaFromGoals < ActiveRecord::Migration
  def up
    remove_column :goals, :meta
  end

  def down
    add_column :goals, :meta, :string
  end
end
