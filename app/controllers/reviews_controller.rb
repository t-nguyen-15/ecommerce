class ReviewsController < ApplicationController
  # before_action :set_review
  before_action :set_product
  before_action :logged_in_user, only:[:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id
    if @review.save
      flash[:success] = "Review created!"
      redirect_to @product 
    else
      render 'new', status: :unprocessable_entity
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_review
    #   @review = Review.find(params[:id])
    # end

    def set_product
      @product = Product.find(params[:product_id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end 
end
