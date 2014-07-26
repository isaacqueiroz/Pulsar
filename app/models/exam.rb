class Exam < ActiveRecord::Base
  attr_accessible :acidourico, :androst, :bilirrubina, :catomico, :cknac, :cortisol, :creatina, :cristais, :densidade, :estradiol, :fosfatase, :fsh, :ggt, :glicose, :hdl, :hemoglobina, :homocist, :insulina, :ldl, :lh, :lipoprot, :lpo, :ph, :prolactina, :sedimento, :shbg, :soridutoras, :t3, :t4, :teslivre, :testosterona, :tgo, :tgp, :tsh, :ureia, :vldl, :obs, :dataexame

  belongs_to :user
end
