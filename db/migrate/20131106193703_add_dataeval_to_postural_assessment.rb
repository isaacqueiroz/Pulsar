class AddDataevalToPosturalAssessment < ActiveRecord::Migration
  def change
    add_column :postural_assessments, :dataeval, :date
  end
end
