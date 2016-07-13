class AdminsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret"  #, except: :index

  def index
    @products = Product.all
    render "admin/index"
  end

  def new

  end


end
