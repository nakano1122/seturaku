class UsersController < ApplicationController
  skip_before_action :login_required
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash.now[:notice] = "ユーザ登録に成功しました。"
      redirect_to @user
    else
      flash.now[:notice] = "ユーザ登録に失敗しました"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
