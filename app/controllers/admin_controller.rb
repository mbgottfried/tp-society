class AdminController < ApplicationController

  def orders
  	@users = User.all
  end

end
