class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied, with: :on_access_denied

  def index
    if current_user
      redirect_to controller: 'receipts', action: 'new'
    else
      redirect_to controller: 'devise/sessions', action: 'new'
    end

  end

  private

  def on_access_denied
    flash[:error] = 'You are not authorized to access this page'
    redirect_to root_url
  end
end

