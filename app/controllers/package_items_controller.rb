class PackageItemsController < ApplicationController
  before_action :find_package_item, only: [:destroy, :edit, :update]


  def new
    @package_item = PackageItem.new
    if current_user
      authorize @package_item
    end
  end

  def create
    @package_item = PackageItem.new(package_item_params)
    authorize @package_item
    if @package_item.save
      redirect_to package_path(@package_item.package)
    else
      raise "Couldnt add item to package"
    end
  end

  def edit
  end

  def update
    authorize @package_item
    @package_item.update(packageItem_params)
    redirect_to user_path(current_user)
  end

  def destroy
    package = @package_item.package
    authorize @package_item
    @package_item.destroy
    redirect_to package_path(package.id)
  end

  private

  def package_item_params
    params.require(:package_item).permit(:package_id, :item_id)
  end

  def find_package_item
    @package_item = PackageItem.find(params[:id])
  end


end
