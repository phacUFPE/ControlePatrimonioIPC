class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_locale
 
  def set_locale
    session[:locale] = params[:locale] if params[:locale].present?
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_url
    end
  end

  rescue_from CanCan::AccessDenied do
    redirect_to equipment_index_url
  end

end
