class ReviewsController < ApplicationController

  def create
    @review = Review.new(category_params)
    @product = Product.find params[:product_id]

    @review.user_id = current_user.id
    @review.product_id = params[:product_id]

    if @review.save
      flash[:notice] = "Thanks for the review!"
      redirect_to product_path params[:product_id]
    else
      flash[:notice] = "Review error, please try again"
      redirect_to product_path params[:product_id]
    end

  end

  def destroy
    @review = Review.find params[:id]

    if @review.user_id == current_user.id
    @review.destroy
    redirect_to product_path(@review.product)
  else
    redirect_to product_path(@review.product)
    end

  end




  private

  def category_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end



end
