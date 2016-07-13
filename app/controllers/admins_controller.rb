class AdminsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret"

  def index
    @products = Product.all
    render 'admin/index'
  end

 def show
    @product = Product.find(params[:id])
    render 'admin/show'
  end

  def new
    @product = Product.new
    render 'admin/new'
  end

  def edit
    @product = Product.find(params[:id])
    render 'admin/edit'
  end

  def update
    # Routes through PRODUCT controller
  end

  def create
    # Routes through the PRODUCT controller
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:delete] = "Item successfully deleted"

    redirect_to '/../admins'
  end

  private

  def product_params
    params.require(:product).permit(:name, :photo, :stock, :description, :price)
  end

end
