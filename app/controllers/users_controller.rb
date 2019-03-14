class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy, :edit, :update]

  def show
    authorize @user
    @active_tab = "account"
    render layout: "dashboard"
  end

  def overview
    @user = current_user
    authorize @user
    @active_tab = "overview"
    render layout: "dashboard"
  end

  def destroy
  end

  def edit
    authorize @user
  end

  def update
    authorize @user

    if params[:user][:active_package_id]
      package = Package.find(params[:user][:active_package_id])
      @user.update(active_package: package)
      redirect_to package_path(package)
    else
      if params[:user][:password] && !params[:user][:password].empty?
        user_params[:password] = params[:user][:password]
        user_params[:password_confirmation] = params[:user][:password_confirmation]
      end
      if @user.update(user_params)
        flash[:notice] = "Updated profile succesfully"
        redirect_to user_path(@user)
      else
        render :show
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :city, :postcode)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
