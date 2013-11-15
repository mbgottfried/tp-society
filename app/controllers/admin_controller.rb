class AdminController < ApplicationController

  def orders
  	@users = User.all
  end

  def admin
  end

end
