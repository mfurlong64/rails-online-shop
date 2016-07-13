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

    if @product.update(product_params)
      #@products = Product.all   #Redeclare the @products for the render
      redirect_to '/../admins'
    else
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to '/../admins'
    else
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to '/../admins'
  end

  private

  def product_params
    params.require(:product).permit(:name, :photo, :stock, :description, :price)
  end

end
