class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ new create ]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user.present? && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to home_path, notice: "Login successfully."
    else
      redirect_to root_path, notice: "Email or password incorrect."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logout successfully"
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
