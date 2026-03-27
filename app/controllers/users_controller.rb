class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ new create ]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, notice: "Sing up successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:session).permit(
        :name,
        :last_name,
        :email,
        :password,
        :password_confirmation
      )
    end
end
