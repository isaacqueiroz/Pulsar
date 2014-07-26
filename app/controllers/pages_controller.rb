# encoding: utf-8
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

  def exams
    @user = current_user
    @exams = @user.exams.last(2)
    if !@user.profile.blank?
      @idade = Date.today.year - @user.profile.birthdate.year
      @idade -= 1 if Date.today <  @user.profile.birthdate + @idade.year
      @colesterol_valor = case @idade
        when 0..29 then 200
        when 30..39 then 225
        when 40..49 then 245
        when 50..100 then 265
        else 0
      end
      @colesterol_total = @user.exams.last.hdl + @user.exams.last.ldl + @user.exams.last.vldl
      @colesterol_diferenca = @colesterol_total - (@user.exams.first.hdl + @user.exams.first.ldl + @user.exams.first.vldl)
      if @colesterol_total > @colesterol_valor
        @colesterol_mensagem = "acima"
      else
        @colesterol_mensagem = "abaixo"
      end
      if (@user.exams.last.hdl < 40 && @user.profile.sex = "masc") || (@user.exams.last.hdl < 50 && @user.profile.sex = "fem")
        @hdl_mensagem = "baixos, existem mais riscos de problemas cardíacos."
      elsif @user.exams.last.hdl.between?(40,59)
        @hdl_mensagem = "normais."
      elsif @user.exams.last.hdl >= 60
        @hdl_mensagem = "altos, considerado um fator de proteção para o coração"
      else
        @hdl_mensagem = "não calculados"
      end
      @hdl_comparativo = @user.exams.last.hdl - @user.exams.first.hdl
    else
      @colesterol_valor = 0
      @hdl_mensagem = "não calculados"
    end      
      
  end
end
