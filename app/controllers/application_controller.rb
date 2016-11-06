class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied, with: :on_access_denied

  def index
  end

  private

  def on_access_denied
    flash[:error] = 'You are not authorized to access this page'
    redirect_to root_url
  end
end

