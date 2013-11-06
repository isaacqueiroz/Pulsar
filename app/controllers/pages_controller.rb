class PagesController < ApplicationController

  def home
  end

  def administration
  	@users = User.all
  end

end
