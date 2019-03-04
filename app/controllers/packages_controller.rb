class PackagesController < ApplicationController
  before_action :find_package, only: [:show, :destroy, :edit, :update]

  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
    if current_user
      authorize @package
    end
  end

  def create
    @package = Package.new(package_params)
    @package.user = current_user
    authorize @package
    if (@package.save)
     redirect_to user_path(@package.user)
    else
     render :new
    end
  end

  def edit
  end

  def update
    authorize @package
    @package.update(package_params)
    redirect_to user_path(current_user)
  end

  def destroy
  end

  private

  def package_params
    params.require(:package).permit(:user_id, :description, :price_range)
  end

  def find_package
    @package = Package.find(params[:id])
  end
end
