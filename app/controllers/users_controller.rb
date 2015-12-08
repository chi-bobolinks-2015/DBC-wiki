class UsersController < ApplicationController
  
  def new
    @user = User.new
    render 'user/new'
  end

  def create
  	@user = User.new(user_params)
    if @user.save && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
    	#COULD ADD ERRORS HERE
      redirect_to '/login'
    end
  end

	private 

	def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
