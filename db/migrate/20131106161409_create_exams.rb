class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :hdl
      t.integer :ldl
      t.integer :vldl
      t.integer :tgo
      t.integer :tgp
      t.integer :ggt
      t.integer :fosfatase
      t.integer :bilirrubina
      t.integer :acidourico
      t.integer :ureia
      t.integer :creatina
      t.integer :cknac
      t.integer :glicose
      t.integer :tsh
      t.integer :t4
      t.integer :fsh
      t.integer :prolactina
      t.integer :testosterona
      t.integer :estradiol
      t.integer :lh
      t.integer :lpo
      t.integer :t3
      t.integer :lipoprot
      t.integer :androst
      t.integer :cortisol
      t.integer :homocist
      t.integer :shbg
      t.integer :teslivre
      t.integer :insulina
      t.integer :densidade
      t.integer :ph
      t.integer :sedimento
      t.integer :soridutoras
      t.integer :catomico
      t.integer :hemoglobina
      t.integer :cristais

      t.timestamps
    end
  end
end
