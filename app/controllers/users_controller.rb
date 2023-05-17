class UsersController < ApplicationController
  before_action :check_admin
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order("employee_number ASC")
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :employee_number, :affiliation, :admin)
  end

  def check_admin
    unless current_user&.admin?
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end
