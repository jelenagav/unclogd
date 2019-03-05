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
    if (@package_item.save)
     redirect_to user_path(current_user)
    else
     redirect_to items_path
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
  end

  private

  def package_item_params
    params.require(:package_item).permit(:package_id, :item_id)
  end

  def find_packageItem_item
    @package_item = PackageItem.find(params[:id])
  end
end
