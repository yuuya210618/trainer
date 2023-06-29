class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @trainings = current_user.trainings
  end

  def edit
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  def update
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :body_weight, :height)
  end
end
