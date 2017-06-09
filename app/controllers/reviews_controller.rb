
class ReviewsController < ApplicationController
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

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
