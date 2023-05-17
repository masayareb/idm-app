class UsersController < ApplicationController
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

end
