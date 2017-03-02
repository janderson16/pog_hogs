class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.item_id = params[:item_id]

    @review.save

    redirect_to item_path(@review.item)
  end

private

  def review_params
    params.require(:review).permit(:author_name, :body)
  end

end
