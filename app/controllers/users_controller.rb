class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @trainings = current_user.trainings
  end

  def edit
  end

  def update
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :body_weight, :height)
  end

end
