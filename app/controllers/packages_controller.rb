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

  def new
    @package = Package.new
    if current_user
      authorize @package
    end
  end

  def create
    if params[:package][:quiz_results]
      quiz_results = params[:package][:quiz_results].values
      @package = Package.new_from_quiz_results(quiz_results)
    else
      @package = Package.new(package_params)
    end

    @package.user = current_user
    authorize @package

    if (@package.save)
     redirect_to package_path(@package)
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
