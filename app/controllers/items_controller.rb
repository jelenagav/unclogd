class ItemsController < ApplicationController
  before_action :find_item, only: [:show]

  def index
    @items = Item.all
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:picture_url, :name, :ingredients, :cruelty, :price, :brand)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
