class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: params[:id])
    @review = Review.new
  end

  # def create
  #   @product = Product.find params[:id]
  #   @review = Review.new(user_params)
  #   if @review.save
  #       redirect_to "/"
  #   else
  #       render :new
  #   end
  # end

  # private
  #   def user_params
  #       params.require(:product).permit(:description, :rating)
  #   end

end
