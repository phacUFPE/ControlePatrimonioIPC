class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
