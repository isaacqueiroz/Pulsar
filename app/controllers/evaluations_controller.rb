# encoding: utf-8

class EvaluationsController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		@evaluation = Evaluation.new
    	@evaluation.build_user
    	if @user.profile.sex.blank?
    		render layout: "new_evaluation_m"
    	else
    		if @user.profile.sex == "masc"
    			render layout: "new_evaluation_m"
    		else
    			render layout: "new_evaluation_f"
    		end
    	end
	end

	def create
		@user = User.find(params[:user_id])
		@evaluation = @user.evaluations.new(params[:evaluation])

	  	if @evaluation.save
    		redirect_to user_evaluation_path(@user, @evaluation), notice: 'Avaliação física criada com sucesso!'
    	else
    		render :action => "new"
		end		
	end

	def show
		@evaluation = Evaluation.find(params[:id])
		@user = User.find(params[:user_id])

		if @user.profile.sex.blank?
    		render layout: "show_evaluation_m"
    	else
    		if @user.profile.sex == "masc"
    			render layout: "show_evaluation_m"
    		else
    			render layout: "show_evaluation_f"
    		end
    	end
	end

	def edit
		@user = User.find(params[:user_id])
		@evaluation = Evaluation.find(params[:id])

		if @user.profile.sex.blank?
    		render layout: "new_evaluation_m"
    	else
    		if @user.profile.sex == "masc"
    			render layout: "new_evaluation_m"
    		else
    			render layout: "new_evaluation_f"
    		end
    	end
	end

	def index
		@user = User.find(params[:user_id])
		@evaluations = @user.evaluations
	end

	def update
		@user = User.find(params[:user_id])
		@evaluation = Evaluation.find(params[:id])
		#@user.evaluation(params[:evaluation_id])

		if @evaluation.update_attributes(params[:evaluation])
			redirect_to([@user,@evaluation], :notice => 'Avaliação Modificada com Sucesso')
		else
			render :action => "edit"
		end
	end

end
