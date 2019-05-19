class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper


  private
  def require_logged_in_user
    unless user_signed_in?
      flash[:danger] = 'Área restrita. Por favor, realize o login.'
      redirect_to entrar_url
    end
  end

end
