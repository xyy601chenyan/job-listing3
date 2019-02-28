class WelcomeController < ApplicationController
  def index
    flash[:notice] = "上午好！"
  end
end
