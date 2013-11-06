# encoding: utf-8

class PosturalAssessmentsController < ApplicationController

	def new
		@user = current_user
		@postural_assessment = PosturalAssessment.new
		@postural_assessment.build_user
	end

	def create
		@user = current_user
		@postural_assessment = @user.postural_assessments.new(params[:postural_assessment])
		if @postural_assessment.save
			redirect_to user_postural_assessment_path(@user, @postural_assessment), notice: 'Avaliação postural criada com sucesso!'
		else
			render :action => "new"
		end
	end

	def show
		@user = current_user
		@postural_assessment = @user.postural_assessments.find(params[:id])		
	end

	def edit
		@user = current_user
		@postural_assessment = @user.postural_assessments.find(params[:id])		
	end

	def index
		@user = current_user
		@postural_assessment = @user.postural_assessments.find(params[:id])		
	end

	def update
		@user = current_user
		@postural_assessment = @user.postural_assessments.find(params[:id])

		if @postural_assessment.update_attributes(params[:postural_assessment])
			redirect_to user_postural_assessment_path(@user, @postural_assessment), notice: 'Avaliação postural alterada com sucesso!'
		else
			render :action => "edit"
		end
	end
end
