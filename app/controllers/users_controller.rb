class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def index
    redirect_to '/users/#{current_user.id}'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username,        
      :password,:email))
    session[:user_id] = @user.id
    if @user.save  
      UserMailer.welcome_email(@user).deliver_now
      redirect_to '/articles'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
