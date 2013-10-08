class AddNewDetailsToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :dataeval, :date
    add_column :evaluations, :altura, :integer
    add_column :evaluations, :pgordurai, :integer
    add_column :evaluations, :pesodes, :integer
    add_column :evaluations, :imc, :integer
    add_column :evaluations, :metbasal, :integer
    add_column :evaluations, :mantbracod, :integer
    add_column :evaluations, :mantbracoe, :integer
    add_column :evaluations, :mbracod, :integer
    add_column :evaluations, :mbracoe, :integer
    add_column :evaluations, :mcoxad, :integer
    add_column :evaluations, :mcoxae, :integer
    add_column :evaluations, :mpantd, :integer
    add_column :evaluations, :mpante, :integer
    add_column :evaluations, :mbicepsd, :integer
    add_column :evaluations, :mbicepse, :integer
  end
end
