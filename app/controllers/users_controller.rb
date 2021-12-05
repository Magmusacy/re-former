class UsersController < ApplicationController
  def create
    #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # tu bedzie id bo id jest dynamic partem of url i zawsze dynamic party sa tutaj chyba zobacz routing loll
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to new_user_path
    else
      p @user.errors.full_messages
      p @user
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
