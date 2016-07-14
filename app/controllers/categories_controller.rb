class CategoriesController < ApplicationController

  def index

  end

  def show
    @category = Category.find(params[:id])
    render :show
  end

  private

  def category_params
    params.require(:category).permit(:name, :id)
  end
end
