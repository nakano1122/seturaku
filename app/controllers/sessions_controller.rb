class SessionsController < ApplicationController
  skip_before_action :login_required
  
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in user
      redirect_to items_path, notice: 'ログインしました。'
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが無効です'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
