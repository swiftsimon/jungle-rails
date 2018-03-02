class ProductsController < ApplicationController

  def index     # calls active controller to retrieve all Product
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new

  end
end

## the def index will call the /views/products/index/html.erb

## name should be PluralController  so ProductsController  UsersController