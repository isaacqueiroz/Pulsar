# encoding: utf-8

class EvaluationsController < ApplicationController

	def new
		@user = current_user
		@evaluation = Evaluation.new
    	@evaluation.build_user
    	render layout: "new_evaluation"
	end

	def create
		@user = current_user
		@evaluation = @user.evaluations.new(params[:evaluation])

	  	if @evaluation.save
    		redirect_to user_evaluation_path(@user, @evaluation), notice: 'Avaliação física criada com sucesso!'
    	else
    		render :action => "new"
		end		
	end

	def show
		@evaluation = Evaluation.find(params[:id])
		render layout: "show_evaluation"
	end

	def edit
		@user = current_user
		@evaluation = Evaluation.find(params[:id])
	end

	def index
		@user = current_user
		@evaluations = @user.evaluations
	end

	def update
		@user = current_user
		@evaluation = Evaluation.find(params[:id])
		#@user.evaluation(params[:evaluation_id])

		if @evaluation.update_attributes(params[:evaluation])
			redirect_to([@user,@evaluation], :notice => 'Perfil Modificado com Sucesso')
		else
			render :action => "edit"
		end
	end

end
