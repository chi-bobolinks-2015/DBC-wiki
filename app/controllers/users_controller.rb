class UsersController < ApplicationController
 include ApplicationHelper
  def new

    render 'user/new'
  end

  def create
  	@user = User.new(user_params)
    if @user.save && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render 'user/new'
    end
  end

  def show
    if is_admin?
      render '/admin/show'
    else
      render "/user/show"
    end
  end

	private

	def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
