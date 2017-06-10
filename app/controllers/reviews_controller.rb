
class ReviewsController < ApplicationController

  before_action :require_login

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id


    if @review.save
      redirect_to @review.product, notice: 'Review was successfully created.'
    else
      redirect_to @review.product, notice: 'Failed to create the review'
    end
  end

  def destroy
    review = Review.find(params[:id])
    if current_user == review.user
      review.destroy
      redirect_to review.product, notice: 'Review was successfully deleted.'
    else
      redirect_to review.product, error: 'Failed to delete review'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:description, :rating)
    end

    def require_login
      unless current_user
        flash[:error] = "You must be logged in to access this"
        redirect_to '/login'
      end
    end
end
