class UsersController < ApplicationController
  before_action :check_admin

  def index
    @users = User.all
  end

  def edit
  end

  def update
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

end
