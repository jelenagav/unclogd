class ItemsController < ApplicationController
  before_action :find_item, only: [:show]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR brand ILIKE :query"
      @items = policy_scope(Item.where(sql_query, query: "%#{params[:query]}%"))
    else
      @items = policy_scope(Item.all)
    end
  end

  def show
    authorize @item
    @package_item = PackageItem.new(package: current_user.active_package, item: @item)
  end

  private

  def item_params
    params.require(:item).permit(:picture_url, :name, :ingredients, :cruelty, :price, :brand)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
