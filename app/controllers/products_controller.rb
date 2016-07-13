class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)       # Hard redirects from admin view pages, cant access w/o login
      flash[:update] = "Item successfully updated"
      redirect_to '/../admins'
    else
      render "admin/edit"
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:create] = "Item successfully created"
      redirect_to '/../admins'
    else
      render "admin/new"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:delete] = "item successfully deleted"

    redirect_to '/../admins'
  end

  private

  def product_params
    params.require(:product).permit(:name, :photo, :stock, :description, :price)
  end

end
