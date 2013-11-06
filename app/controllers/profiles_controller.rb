class ProfilesController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@profile = Profile.new
    	@profile.build_user
	end

	def create
		@user = User.find(params[:user_id])
		@profile = @user.create_profile(params[:profile])

	  	if @profile.save
    		redirect_to user_profile_path(@user), notice: 'Perfil Criado com Sucesso'
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@profile = @user.profile
	end

	def show
		@profile = User.find(params[:user_id]).profile
	end

	def update
		@user = User.find(params[:user_id])
		@profile = @user.profile

		if @profile.update_attributes(params[:profile])
			redirect_to(user_profile_path(@user), :notice => 'Perfil Modificado com Sucesso')
		else
			render :action => "edit"
		end
	end
end
