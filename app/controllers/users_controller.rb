class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy, :edit, :update]

  def show
    authorize @user
  end

  def destroy
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
