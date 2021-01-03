class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username,        
      :password,:email))
    session[:user_id] = @user.id
    if @user.save  
      redirect_to '/welcome'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
