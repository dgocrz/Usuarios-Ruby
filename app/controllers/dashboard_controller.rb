class DashboardController < ApplicationController
  before_action :require_login

  def index
    @posts = current_user.posts
  end

  private

  def require_login
    unless session[:user_id]
      redirect_to login_path, alert: "Debes iniciar sesión para acceder al dashboard 🔒"
    end
  end
end
