class UsersController < ApplicationController
 include ApplicationHelper
  def new

    render 'users/new'
  end

  def create
  	@user = User.new(user_params)
    if @user.save && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render 'users/new'
    end
  end

  def show
    @user = User.find_by(id: current_user.id)
    if is_admin?
      render '/admin/show'
    else
      render "/users/show"
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    render 'users/edit'
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(username: user_params[:username], email: user_params[:email], password: user_params[:password])
      # flash[:success] = "Profile updated"
      redirect_to "/"
    else
      @errors = @user.errors.full_messages
      render 'users/edit'
    end
  end

  def delete
    #code
  end

	private

	def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
