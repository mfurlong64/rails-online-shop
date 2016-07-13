class AdminsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret"

  def index
    @products = Product.all
    render "admin/index"
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
    @product = Product.find(params[:id])

    if @product.update(product_params)
      render 'admin/index'
    else
      render 'admin/edit'
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render 'admin'
    else
      render 'admin/new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to 'admin'
  end

  private

  def product_params
    params.require(:product).permit(:name, :photo, :stock, :description, :price)
  end

end
