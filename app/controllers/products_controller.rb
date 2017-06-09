class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @new_review = Review.new
  end

  # private

  #   def product_params
  #     params.require(:product).permit(:)
  #   end
end
