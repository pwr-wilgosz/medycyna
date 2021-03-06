class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied, with: :on_access_denied
  rescue_from ActiveRecord::RecordNotFound, with: :on_record_not_found

  def index
    if current_user
      case current_user.role
      when 'doctor'
        redirect_to users_path
      when 'patient'
        redirect_to user_path(current_user)
      end
    else
      redirect_to controller: 'devise/sessions', action: 'new'
    end
  end

  def search
    @user = User.find_by!(pesel: params[:pesel])
    redirect_to user_path(@user)
  end

  private

  def on_access_denied
    flash[:error] = 'You are not authorized to access this page'
    redirect_to root_url
  end

  def on_record_not_found
    flash[:error] = 'Requested page cannot be found'
    redirect_to root_url
  end
end

