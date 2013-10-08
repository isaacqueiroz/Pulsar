class ProfilesController < ApplicationController
	def new
		@user = current_user
		@profile = Profile.new
    	@profile.build_user
	end

	def create
		@user = current_user
		@profile = @user.create_profile(params[:profile])

	  	if @profile.save
    		redirect_to user_profile_path(@user), notice: 'Perfil Criado com Sucesso'
		end
	end

	def edit
		@user = current_user
		@profile = @user.profile
	end

	def show
		@profile = current_user.profile
	end

	def update
		@user = current_user
		@profile = @user.profile

		if @profile.update_attributes(params[:profile])
			redirect_to(user_profile_path(@user), :notice => 'Perfil Modificado com Sucesso')
		else
			render :action => "edit"
		end
	end
end
