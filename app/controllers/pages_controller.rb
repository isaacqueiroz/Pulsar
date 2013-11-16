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
    if !@user.profile.blank? && !@exams.blank?
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

  def details
    @user = current_user
    @details_all = Detail.where(evaluation_id: @user.evaluations.all).last(3)
    @cronicos = Detail.where(cronico: true)
    @details = @details_all - @cronicos
    if @user.profile.sex.blank?
        render layout: "show_details_m"
    else
      if @user.profile.sex == "masc"
        render layout: "show_details_m"
      else
        render layout: "show_details_f"
      end
    end
  end

  private
  def detail_message(item)
    if @user.profile.blank? || @user.profile.sex == "masc"
      message = case item
        when 1
          "Pescoço"
        when 2
          "Mão Direita"
        when 3
          "Mão Esquerda"
        when 4
          "Punho e Antebraço Direito"
        when 5
          "Punho e Antebraço Esquerdo"
        when 6
          "Braço Superior e Ombro Esquerdo"
        when 7
          "Braço Superior e Ombro Direito"
        when 8
          "Abdomen"
        when 9
          "Pelve e Virilha Direita"
        when 10
          "Pelve e Virilha Esquerda"
        when 11
          "Coxa Direita"
        when 12
          "Coxa Esquerda"
        when 13
          "Joelho Direito"
        when 14
          "Joelho Esquerdo"
        when 15
          "Perna Direita"
        when 16
          "Perna Esquerda"
        when 17
          "Pé Direito"
        when 18
          "Pé Esquerdo"
        when 19
          "Dorso"
        when 20
          "Cotovelo Esquerdo"
        when 21
          "Cotovelo Direito"
        when 22
          "Tornozelo Esquerdo"
        when 23
          "Tornozelo Direito"      
        else
          "Não Informado"
      end
    else
      message = case item
        when 1 
          "Pescoço"
        when 2
          "Mão e Pulso Direito"
        when 3
          "Mão e Pulso Esquerdo"
        when 4
          "Antebraço Esquerdo"
        when 5
          "Antebraço Direito"
        when 6
          "Braço Superior e Ombro Direito"
        when 7
          "Braço Superior e Ombro Esquerdo"
        when 8
          "Peitoral"
        when 9
          "Abdomen"
        when 10
          "Virilha e Pelve Direitas"
        when 11
          "Virilha e Pelve Esquerdas"
        when 12
          "Coxa Direita"
        when 13
          "Coxa Esquerda"
        when 14
          "Joelho Direito"
        when 15
          "Joelho Esquerdo"
        when 16
          "Perna Direita"
        when 17
          "Perna Esquerda"
        when 18
          "Pé Direito"
        when 19
          "Pé Esquerdo"
        when 20
          "Dorso"
        when 21
          "Cotovelo Esquerdo"
        when 22
          "Cotovelo Direito"
        when 23
          "Tornozelo Esquerdo"
        when 24
          "Tornozelo Direito"
        else
          "Não Informado"
      end   
    end
    return message
  end

  helper_method :detail_message
end
