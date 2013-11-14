class PagesController < ApplicationController

  def home
  end

  def administration
  	@users = User.all
  end

  def userpanel
  	@user = User.find(params[:user_id])
  end

  def sumary
  	@user = current_user
  	@evaluations = @user.evaluations.last(2)
    @metas = Goal.find_all_by_evaluation_id(@user.evaluations)
  	@imc_message = case @evaluations.last.imc 
  		when 1..18.5 then "abaixo do peso!"
  		when 18.6..24.9 then "no peso considerado ideal!"
  		when 25..29.9 then "levemente acima do peso." 
  		when 30..40 then "acima do peso, mas podemos melhorar isso!"  	
  		else @imc_message = "Nenhum IMC informado"
  	end
  end

end
