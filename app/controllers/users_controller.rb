class UsersController < ApplicationController
  load_and_authorize_resource :user

  def index
    @users = User.where(role: 'patient')
  end

  def show
  end

  def new
    @user = User.new(role: 'patient')
  end

  def create
    @user = User.new(user_params.merge(role: 'patient'))
    if @user.save
      redirect_to user_receipts_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :pesel, :email)
  end

  def receipt
    @user = User.find(params[:id])
  end
end

