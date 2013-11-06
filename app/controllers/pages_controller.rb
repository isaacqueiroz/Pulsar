class PagesController < ApplicationController

  def home
  end

  def administration
  	@users = User.all
  end

  def userpanel
  	@user = User.find(params[:user_id])
  end

end
