class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :destroy, :edit, :update]

  def index
    @orders = Order.all
    @orders = policy_scope(Order.all)
    @active_tab = "orders"
    render layout: "dashboard"
  end

  def root
    authorize @user
    @active_tab = "returns"
    redirect_to root_path
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def new
    @order = Order.new
    if current_user
      authorize @order
    end
  end

  def create
    package = current_user.active_package
    order = Order.create!(package: package, amount: package.price_range, status: 'pending')
    authorize order
    redirect_to new_order_payment_path(order)
  end

  # def create
  #   @order = Order.new(order_params)
  #   authorize @order
  #   @order.save
  #   redirect_to items_path
  # end

  def edit

  end

  def update
    authorize @order
    @order.update(order_params)
    redirect_to user_path(current_user)
  end

  def destroy
    authorize @order
    @order.destroy
    redirect_to package_path(@order.package_id)
  end

  private

  def order_params
    params.require(:order).permit(:package_id, :status)
  end

  def find_order
    @order = Order.find(params[:id])
  end
end
