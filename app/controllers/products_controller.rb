class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new

  end

  def edit

  end


  def update
    @product = Product.find(params[:id])

    if Category.find_by(name: category_params[:name])
      @category = Category.find_by(name: category_params[:name])
    else
      @category = Category.new(category_params)
    end

    if @product.update(product_params) && @category.save      # Hard redirects from admin view pages, cant access w/o login
       CategoryProduct.create(category_id: @category.id, product_id: @product.id)
      flash[:update] = "Item successfully updated"
      redirect_to '/../admins'
    elsif @product.update(product_params)
      flash[:update] = "Item successfully updated"
      redirect_to '/../admins'
    else
      render "admin/edit"
    end
  end

  def create

    @product = Product.new(product_params)
    if Category.find_by(name: category_params[:name])
      @category = Category.find_by(name: category_params[:name])
    else
      @category = Category.new(category_params)
    end

    if @product.save && @category.save
      CategoryProduct.create(category_id: @category.id, product_id: @product.id)
      flash[:create] = "Item successfully created"
      redirect_to '/../admins'
    elsif @product.save
      flash[:create] = "Item successfully created"
      redirect_to '/../admins'
    else
      render "admin/new"
    end
  end

  def destroy
    # Processed through ADMIN controller
  end

  private

  def product_params
    params.require(:product).permit(:name, :photo, :stock, :description, :price)
  end

  def category_params
    params.require(:category).permit(:name, :id)
  end

end
