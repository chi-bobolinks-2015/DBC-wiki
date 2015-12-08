class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
    # @user = User.find_by_email(user_params[:email])
    # if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      @errors = "invalid credentials"
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  # private
  #
  # def user_params
  #   params.require(:session).permit(:email, :password)
  # end

end
