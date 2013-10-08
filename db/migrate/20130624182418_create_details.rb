class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :area
      t.string :title
      t.text :description
      t.references :evaluation

      t.timestamps
    end
    add_index :details, :evaluation_id
  end
end
