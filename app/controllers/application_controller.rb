class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :current_user

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def authenticate_user!
    redirect_to sessions_path, notice: "You have to be logged in." unless current_user
  end
end
