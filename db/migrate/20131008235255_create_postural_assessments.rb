class CreatePosturalAssessments < ActiveRecord::Migration
  def change
    create_table :postural_assessments do |t|
      t.boolean :cifose
      t.boolean :lordose
      t.boolean :escoliose
      t.boolean :artrose
      t.boolean :hernia
      t.text :obs
      t.string :image1
      t.string :image2
      t.string :image3
      t.references :user

      t.timestamps
    end
    add_index :postural_assessments, :user_id
  end
end
