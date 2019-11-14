class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to equipment_index_url
    end
  end
end
