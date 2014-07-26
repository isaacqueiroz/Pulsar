class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.date :tacademia
      t.string :sexo
      t.string :peso
      t.integer :mmagrap
      t.integer :mmagraa
      t.integer :pgordura
      t.integer :mtorax
      t.integer :mabdomen
      t.integer :mcintura
      t.integer :mquadril
      t.integer :mcoxa
      t.integer :tflex
      t.references :user

      t.timestamps
    end
    add_index :evaluations, :user_id
  end
end
