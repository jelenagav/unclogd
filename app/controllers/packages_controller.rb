class PackagesController < ApplicationController
  before_action :find_package, only: [:show, :destroy, :edit, :update]

  def index
    @packages = Package.all
  end

  def show
    authorize @package
    @existing_order = Order.where(package: @package).first
    @number_package = @package.package_items.count
    @new_order = Order.new(package: @package)
  end

  def show_multiple
    @package_1 = Package.find(params[:package_1_id])
    @package_2 = Package.find(params[:package_2_id])
    @package_3 = Package.find(params[:package_3_id])
    authorize @package_1
    authorize @package_2
    authorize @package_3
    @existing_order_1 = Order.where(package: @package_1).first
    @existing_order_2 = Order.where(package: @package_2).first
    @existing_order_3 = Order.where(package: @package_3).first
    @new_order_1 = Order.new(package: @package_1)
    @new_order_2 = Order.new(package: @package_2)
    @new_order_3 = Order.new(package: @package_3)
  end



  def new
    @package = Package.new
    if current_user
      authorize @package
    end
  end

  def create
    if params[:package][:quiz_results]
      quiz_results = params[:package][:quiz_results]
      @package_1 = Package.new_from_quiz_results(quiz_results, "cheap")
      @package_2 = Package.new_from_quiz_results(quiz_results, "normal")
      @package_3 = Package.new_from_quiz_results(quiz_results, "expensive")
    end

    @package_1.user = current_user
    @package_2.user = current_user
    @package_3.user = current_user

    authorize @package_1
    authorize @package_2
    authorize @package_3

    if @package_1.save && @package_2.save && @package_3.save
     redirect_to show_multiple_packages_path(@package_1,@package_2,@package_3)
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
